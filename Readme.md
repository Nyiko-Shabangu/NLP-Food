# South African Food Ordering Chatbot Backend

This project is a FastAPI backend for a Dialogflow-powered food ordering chatbot. Users can place, modify, and track orders for South African cuisine using natural language. The backend interacts with a MySQL database to store and retrieve order information.

---

## Features

- **Add to Order:** Add South African food items and quantities to your order.
- **Remove from Order:** Remove items from your current order.
- **Complete Order:** Finalize your order, save it to the database, and receive an order ID and total price.
- **Track Order:** Check the status of your order using the order ID.

---

## Technologies Used

- **FastAPI** — RESTful API framework.
- **Dialogflow** — Natural language understanding and intent detection.
- **MySQL** — Persistent order storage.
- **ngrok** (optional) — Expose your local server to Dialogflow.

---

## South African Menu Reference

Available items:
- Bunny Chow
- Boerewors Roll
- Pap & Chakalaka
- Bobotie
- Vetkoek
- Kota
- Malva Pudding
- Milk Tart
- Sosaties

---

## Setup Instructions

1. **Clone the repository**
   ```sh
   git clone <https://github.com/ST10119175/NLP-Food-.git>
   cd NLP food
   ```

2. **Install dependencies**
   ```sh
   pip install fastapi uvicorn mysql-connector-python
   ```

3. **Configure MySQL**
   - Ensure MySQL is installed and running.
   - Create a database named `FOOD_delivery` and run the SQL in [`DB.sql`](DB.sql) to set up tables.
   - Update credentials in `db_helper.py` if needed.

4. **Run the FastAPI server**
   ```sh
   uvicorn Main:app --reload
   ```

5. **Expose your server to Dialogflow (optional)**
   ```sh
   ngrok http 8000
   ```
   Use the generated HTTPS URL as your Dialogflow webhook.

---

## File Structure

- `Main.py` — FastAPI app and intent handler functions.
- `db_helper.py` — Database helper functions for order management.
- `generic_helper.py` — Utility functions for session and string handling.
- `DB.sql` — SQL schema for MySQL database.

---

## Example Dialogflow Webhook Request

```json
{
  "queryResult": {
    "intent": { "displayName": "order.add" },
    "parameters": {
      "food-item": ["Bunny Chow", "Milk Tart"],
      "number": [2, 1]
    }
  }
}
```

## Example Response

```json
{
  "fulfillmentText": "So far you have: 2 Bunny Chow, 1 Milk Tart. Do you need anything else?"
}
```

---

## Dialogflow Entities (Dummy Examples)

- **@food_item:** Bunny Chow, Boerewors Roll, Pap & Chakalaka, Bobotie, Vetkoek, Kota, Malva Pudding, Milk Tart, Sosaties
- **@quantity:** one, two, three, four, five, 1, 2, 3, 4, 5
- **@order_id:** 12345, 6789, 341, 453, 63321

---

## Notes

- Make sure your Dialogflow intent names match those in `intent_handler_dict` in `Main.py`.
- The backend expects certain parameter keys (e.g., `food-item`, `number`, `order_id`). Adjust Dialogflow entities and parameters accordingly.
- All responses are returned in the `fulfillmentText` field for Dialogflow compatibility.
- For South African food, update your Dialogflow entities and training phrases to match the menu above.

---

## License