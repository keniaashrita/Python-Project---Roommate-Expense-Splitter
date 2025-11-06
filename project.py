import mysql.connector
from mysql.connector import Error
from datetime import datetime

# ----------------- CONFIG -----------------
DB_CONFIG = {
    "host": "localhost",
    "user": "root",
    "password": "Keni@7777",
    "database": "roommate_expense_db"
}

# ----------------- DB CONNECTION -----------------
def get_connection():
    try:
        conn = mysql.connector.connect(**DB_CONFIG)
        return conn
    except Error as e:
        print("❌ Could not connect to MySQL:", e)
        return None

# ----------------- FUNCTIONS -----------------
def insert_expense(conn, payer, participants, amount, split_amount, date_str, description, notes):
    query = """
    INSERT INTO expenses (payer, participants, amount, split_amount, date, description, notes)
    VALUES (%s, %s, %s, %s, %s, %s, %s)
    """
    try:
        date_obj = datetime.strptime(date_str, "%Y-%m-%d").date()
    except ValueError:
        print("❌ Invalid date format. Use YYYY-MM-DD.")
        return

    values = (payer, participants, amount, split_amount, date_obj, description, notes)
    try:
        cursor = conn.cursor()
        cursor.execute(query, values)
        conn.commit()
        print("✅ Expense added successfully (ID: {}).".format(cursor.lastrowid))
    except Error as e:
        print("❌ Insert failed:", e)

def view_expenses(conn):
    query = "SELECT id, payer, participants, amount, split_amount, date, description, notes FROM expenses ORDER BY date;"
    cursor = conn.cursor()
    cursor.execute(query)
    rows = cursor.fetchall()
    if not rows:
        print("⚠️ No expense records found.")
        return
    # Print header
    header = "{:<4} {:<10} {:<28} {:>8} {:>10} {:>12}  {}".format("ID", "Payer", "Participants", "Amount", "Per Person", "Date", "Description")
    print("\n" + header)
    print("-" * len(header))
    for r in rows:
        id_, payer, participants, amount, split_amount, date_, description, notes = r
        participants_short = (participants[:24] + '...') if len(participants) > 27 else participants
        print("{:<4} {:<10} {:<28} {:>8.2f} {:>10.2f} {:>12}  {}".format(id_, payer, participants_short, float(amount), float(split_amount), date_.isoformat(), description or ""))

def calculate_who_owes(conn):
    """
    Simple helper to show net balances per person based on expenses table.
    This assumes participants column is comma-separated names and split_amount is the share per person.
    """
    cursor = conn.cursor()
    cursor.execute("SELECT payer, participants, amount, split_amount FROM expenses;")
    rows = cursor.fetchall()
    balances = {}  # name -> net (positive = should receive, negative = owes)
    for payer, participants, total_amt, split_amt in rows:
        parts = [p.strip() for p in participants.split(",") if p.strip()]
        # Ensure keys exist
        for p in parts:
            balances.setdefault(p, 0.0)
        balances.setdefault(payer, 0.0)

        # Each participant owes split_amt to payer; payer effectively paid whole amount
        for p in parts:
            if p == payer:
                # payer's net increases by (total - share_of_self) OR simply (total - split_amt)
                balances[payer] += (float(total_amt) - float(split_amt))
            else:
                balances[p] -= float(split_amt)
    # Print balances
    print("\nNet balances (positive = should receive, negative = owes):")
    for person, net in balances.items():
        print(f"{person:15} : {net:+.2f}")
    print("Note: This is a simple aggregation based on recorded entries.")

# ----------------- MENU -----------------
def main_menu():
    conn = get_connection()
    if not conn:
        return
    try:
        while True:
            print("\n====== ROOMMATE EXPENSE SPLITTER ======")
            print("1. Add Expense")
            print("2. View All Expenses")
            print("3. Show Net Balances (who owes whom)")
            print("4. Exit")
            choice = input("Enter choice: ").strip()
            if choice == "1":
                payer = input("Payer name: ").strip()
                participants = input("Participants (comma separated): ").strip()
                try:
                    amount = float(input("Total amount: ").strip())
                    split_amount = float(input("Split per person: ").strip())
                except ValueError:
                    print("❌ Enter a valid numeric amount.")
                    continue
                date_str = input("Date (YYYY-MM-DD): ").strip()
                description = input("Description: ").strip()
                notes = input("Notes (optional): ").strip()
                insert_expense(conn, payer, participants, amount, split_amount, date_str, description, notes)
            elif choice == "2":
                view_expenses(conn)
            elif choice == "3":
                calculate_who_owes(conn)
            elif choice == "4":
                print("🔒 Exiting...")
                break
            else:
                print("❌ Invalid choice. Try again.")
    finally:
        conn.close()

if __name__ == "__main__":
    main_menu()
