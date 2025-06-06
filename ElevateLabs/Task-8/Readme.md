## 📊 Task 8 – Simple Sales Dashboard Design

**Internship Task:** Data Analyst Internship – Task 8
**Tool Used:** Power BI
**Dataset Used:** [Superstore\_Sales.csv](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final)

---

### 📌 Objective

Create a basic interactive dashboard to visualize **sales performance** by **product category**, **region**, and **month**, helping to uncover key business insights.

---

### 🔧 Steps Followed

1. **Imported Dataset into Power BI**

   * Used the Superstore\_Sales.csv file containing columns like Order Date, Sales, Profit, Region, and Category.

2. **Created New Date Format**

   * Added a new calculated column using DAX:

     ```DAX
     MonthYear = FORMAT('Superstore_Sales'[Order Date], "MMM-YYYY")
     ```

3. **Built Visuals**

   * **Line Chart:** Sales trend over months.
   * **Bar Chart:** Sales distribution across regions.
   * **Donut Chart:** Category-wise sales performance.

4. **Added Filters**

   * Used a slicer to filter visuals by Region.

5. **Formatted Dashboard**

   * Applied distinct colors to highlight top-performing regions and categories.
   * Organized visuals clearly for readability.

---

### 📈 Insights

1. The **West** region had the highest overall sales.
2. **Technology** emerged as the top-performing category.
3. Sales peaked in **December**, indicating strong seasonal demand.
4. The **Furniture** category consistently showed lower profits.

---

### 📁 Repository Content

| File                   | Description                        |
| ---------------------- | ---------------------------------- |
| `Superstore_Sales.csv` | Dataset used for dashboard         |
| `dashboard.pdf`        | Exported Power BI dashboard        |
| `insights.txt`         | 3–4 key insights derived from data |
| `README.md`            | This file explaining the task      |

---

### ✅ Outcome

This task helped me understand:

* How to design and format an effective Power BI dashboard
* The importance of slicers, color coding, and data storytelling
* Techniques to summarize business data visually


