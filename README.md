<!-- Banner -->
<div align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&height=220&section=header&text=SQL%20Practice%20Repository&fontSize=52&fontAlignY=38&animation=twinkling&fontColor=white" width="100%"/>
</div>

<p align="center">
  <b>Practice-first SQL repository · Built for long-term interview readiness</b>
</p>

<img src="https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png" width="100%">

---

## ✨ Overview

> A **personal SQL practice bank** designed to retain fluency through continuous hands-on problem solving.

This repository does **not teach SQL concepts**.  
It exists to **practice them** — the same way LeetCode problems strengthen logic after learning fundamentals.

<img src="https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png" width="100%">

---

## 🧭 Practice Philosophy

<div align="center">

| Step | Action |
|-----:|--------|
| 1️⃣ | Revise SQL fundamentals (notes / docs / videos) |
| 2️⃣ | Open a `.sql` file from this repo |
| 3️⃣ | Comment out the solution |
| 4️⃣ | Solve the problem yourself |
| 5️⃣ | Compare & optimize |

</div>

Each file is a **problem sheet**, not a walkthrough.

<img src="https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png" width="100%">

---

## 🧠 Quick Recall — GROUP BY & Aggregations

> One-glance rules to reset your brain before writing queries

---

### ✅ GROUP BY Rules (Simple & Sharp)

- All **non-aggregated columns** in `SELECT` must appear in `GROUP BY`  
  *(but not all `GROUP BY` columns must appear in `SELECT`)*

- Columns inside **aggregate functions** do **NOT** need to be in `GROUP BY`

- You **cannot use aggregate functions in `WHERE`**  
  → use `HAVING` instead

- Query execution order:
FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY


- Each group produces **exactly one row** in the result

---

### ✅ Aggregation Rules

- Aggregate functions return **one value per group**

- Aggregate functions **ignore NULL values**  
*(except `COUNT(*)`)*

- You **cannot mix aggregated and non-aggregated columns in `SELECT`**  
without `GROUP BY`

---

### 🧠 One-line Memory Trick

<div align="center">

### `SELECT = GROUP BY columns + aggregate functions only`

</div>

<img src="https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png" width="100%">

---

## ⚙️ Environment

<div align="center">

| Tool | Usage |
|-----|------|
| 🗄️ Database | MySQL |
| 🧪 Execution | MySQL Workbench / compatible clients |
| 🎯 Focus | Query logic, edge cases, interview thinking |

</div>

<img src="https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png" width="100%">

---

## 📚 Topics Covered

### 🟢 Core SQL
- `SELECT`, `DISTINCT`
- `WHERE` clause
- `ORDER BY`, `LIMIT`, `OFFSET`
- Filtering using `IN`, `BETWEEN`, `LIKE`, `IS NULL`
- Conditional filtering patterns

### 🔵 Aggregations
- `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`
- `GROUP BY`
- `HAVING`
- Conditional aggregations
- Multi-column grouping logic

### 🟣 Joins (Interview Heavy)
- `INNER JOIN`
- `LEFT JOIN`, `RIGHT JOIN`
- `SELF JOIN`
- Multi-table joins
- Join conditions vs filter conditions
- Handling NULLs in joins

### 🟠 Subqueries
- Subqueries in `SELECT`, `WHERE`, and `FROM`
- Nested subqueries
- Correlated subqueries
- `EXISTS` / `NOT EXISTS`
- Subqueries vs joins

### 🔴 Window Functions
- `ROW_NUMBER()`
- `RANK()` / `DENSE_RANK()`
- `PARTITION BY`
- Ranking and ordering logic
- Nth highest value problems
- Top-N per group queries

### 🟡 Conditional Logic
- `CASE WHEN`
- Conditional aggregations
- Multi-condition branching
- Categorization and bucketing problems

### 🟤 Date & Time
- Date filtering
- Time-based grouping
- Difference between dates
- Month / year level aggregations
- Edge cases in date logic

### ⚫ Advanced Patterns
- Duplicate detection
- Consecutive records
- Gap analysis
- Rolling calculations
- Multi-step query breakdowns
- Interview-driven logic building

<img src="https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png" width="100%">

---

## 📂 Repository Design

<div align="left">

✅ Practice-oriented queries  
✅ No concept explanations  
✅ Solutions included only as reference  
✅ Optimized for re-solving  

</div>

<img src="https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png" width="100%">

---

## 🎯 Why This Exists

- Maintain long-term SQL muscle memory  
- Avoid last-minute interview panic  
- Improve query speed & accuracy  
- Practice real-world interview logic  

<img src="https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png" width="100%">

---

## 🔗 Reference & Credits

This repository was built using **publicly available learning material** for practice and problem exposure.

Special reference:

- **The Grand Complete Data Science Materials – MySQL Interview Section**  
  https://github.com/krishnaik06/The-Grand-Complete-Data-Science-Materials/tree/main/Complete%20MySQL%20Interview%20Materials

All problems are **re-solved independently** and organized for **long-term interview preparation**.

<img src="https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png" width="100%">

---

## 🧠 Final Thought

<div align="center">

### *“SQL is not remembered — it is retrained.”*

</div>