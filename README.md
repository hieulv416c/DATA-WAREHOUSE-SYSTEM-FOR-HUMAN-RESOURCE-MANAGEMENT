# Integrated Data Warehouse System for Human Resource Management (HRM)

![Project Status](https://img.shields.io/badge/Status-Completed-success)
![Course](https://img.shields.io/badge/Course-Data_Warehouse_%26_Integration-blue)

## 📌 Tổng quan dự án
Dự án này tập trung vào việc xây dựng một hệ thống **Kho dữ liệu (Data Warehouse - DW)** tích hợp để quản lý và phân tích nguồn nhân lực. Bằng cách sử dụng các công cụ **Business Intelligence (BI)**, hệ thống cung cấp các góc nhìn sâu sắc về hiệu suất nhân viên, cấu trúc lương và xu hướng biến động nhân sự, từ đó hỗ trợ ban lãnh đạo đưa ra các quyết định chiến lược dựa trên dữ liệu.

*Dự án được thực hiện bởi Nhóm 4 - Khoa Hệ thống Thông tin, Trường Đại học Kinh tế - Luật (VNU-HCM).*

## 🎯 Mục tiêu
* **Tập trung dữ liệu:** Tích hợp dữ liệu từ nhiều nguồn khác nhau (SQL Server, CSV, Excel) vào một kho dữ liệu duy nhất.
* **Phân tích hiệu suất:** Theo dõi và đánh giá hiệu quả làm việc của nhân viên dựa trên nhiệm vụ và giờ làm.
* **Quản lý chi phí:** Kiểm soát ngân sách dành cho lương, thưởng và chi phí tăng ca (OT).
* **Dự báo biến động:** Phân tích các yếu tố dẫn đến việc nhân viên nghỉ việc để cải thiện chiến lược giữ chân nhân tài.
* **Bảo mật & Quản trị:** Triển khai Audit Logs và phân quyền truy cập (RBAC).

## 🛠 Công nghệ sử dụng
* **Cơ sở dữ liệu:** Microsoft SQL Server (AdventureWorks2019).
* **Công cụ ETL:** SQL Server Integration Services (SSIS).
* **Phân tích dữ liệu (OLAP):** SQL Server Analysis Services (SSAS) - Tabular/Multidimensional model.
* **Ngôn ngữ:** T-SQL, MDX (MultiDimensional eXpressions).
* **Quản lý:** SQL Server Management Studio (SSMS).

## 🏗 Kiến trúc hệ thống
Hệ thống tuân thủ kiến trúc BI tiêu chuẩn:
1. **Nguồn dữ liệu (Data Sources):** AdventureWorks2019 + Files bổ sung (Location, Performance, Salary).
2. **Vùng đệm (Staging Area):** Lưu trữ tạm thời để làm sạch và chuẩn hóa dữ liệu.
3. **Kho dữ liệu (Data Warehouse):** Thiết kế theo mô hình **Star Schema**.
4. **Lớp phân tích (Analytics Layer):** Xây dựng các Cube trong SSAS để phân tích đa chiều và tính toán KPI.

### Mô hình Star Schema
* **Fact Tables:** `FactEmployeeSalary`, `FactPerformance`.
* **Dimension Tables:** `DimEmployee`, `DimDepartment`, `DimLocation`, `DimTime`, `DimShift`.



## 📊 Các chỉ số đo lường (KPIs)
Dự án thiết lập các chỉ số quan trọng như:
* **Efficiency Per Task:** Hiệu suất trên mỗi nhiệm vụ được giao.
* **Average Daily Working Hours:** Số giờ làm việc trung bình mỗi ngày.
* **Turnover Rate:** Tỷ lệ nhân viên nghỉ việc.
* **Total Overtime Cost:** Tổng chi phí làm thêm giờ.

## 🚀 Hướng dẫn cài đặt
### Yêu cầu hệ thống
* SQL Server 2019 trở lên.
* SSIS, SSAS installed.
* SQL Server Management Studio (SSMS).

### Các bước thực hiện
1. **Clone repository:**
   ```bash
   git clone [https://github.com/username/hrm-data-warehouse.git](https://github.com/username/hrm-data-warehouse.git)
