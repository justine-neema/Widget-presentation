# DataTable Demo widget

A simple Flutter application demonstrating how the **DataTable** widget can be used to display structured data in a real-world student attendance scenario.

---

##  Widget Demonstrated

### DataTable

The `DataTable` widget is used to display data in rows and columns, similar to a spreadsheet.

It consists of:
- `DataColumn` → defines table headers
- `DataRow` → represents each row
- `DataCell` → contains individual values

---
## Screenshot image
![alt text](<image.png>)


## Three Demonstrated Properties

### 1 columnSpacing
- Default value: 24
- Controls the horizontal space between columns.
- In this app, it is connected to a Slider.
- Increasing spacing improves readability when data is crowded.

---

### 2 border
- Default value: null (no border)
- When set to `TableBorder.all()`, grid lines appear.
- Controlled using a Switch in this demo.
- Useful when clearer separation of table data is needed.

---

### 3 showCheckboxColumn
- Default value: true
- Displays a checkbox column on the left side.
- Set to false in this app because row selection is handled differently.
- Used when multiple row selection is required.

---
## How to Run the Project

1. Clone the repository:
   ```bash
   git clone https://github.com/justine-neema/Widget-presentation.git