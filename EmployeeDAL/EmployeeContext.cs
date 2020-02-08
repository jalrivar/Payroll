using System;
using System.Collections.Generic;
using EmployeeDAL.Models;
using System.Data;
using System.Data.SqlClient;
using EmployeeDAL.Properties;

namespace EmployeeDAL
{
    public class EmployeeContext
    {
        public List<Employee> SpGetEmployee(string searchStr) 
        {
            var resp = new List<Employee>();
            using (var conn = new SqlConnection(Settings.Default.PayrollEntities))
            {
                conn.Open();
                var cmd = new SqlCommand("SpGetEmployee", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@SearchStr", searchStr);
                using (var dr = cmd.ExecuteReader())
                {
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            var employee = new Employee();
                            employee.EmployeeId = dr.SafeGetInt32("EmployeeId");
                            employee.FirstName = dr.SafeGetString("FirstName");
                            employee.LastName = dr.SafeGetString("LastName");
                            employee.Phone = dr.SafeGetString("Phone");
                            employee.Zip = dr.SafeGetString("Zip");
                            employee.HireDate = dr.SafeGetDateTime("HireDate");
                            resp.Add(employee);
                        }
                    }
                }
            }
            return resp;
        }

        public Employee SpGetEmployeeById(int employeeId)
        {
            var resp = new Employee();
            using (var conn = new SqlConnection(Settings.Default.PayrollEntities))
            {
                conn.Open();
                var cmd = new SqlCommand("SpGetEmployeeById", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@EmployeeId", employeeId);
                using (var dr = cmd.ExecuteReader())
                {
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            resp.EmployeeId = dr.SafeGetInt32("EmployeeId");
                            resp.FirstName = dr.SafeGetString("FirstName");
                            resp.LastName = dr.SafeGetString("LastName");
                            resp.Phone = dr.SafeGetString("Phone");
                            resp.Zip = dr.SafeGetString("Zip");
                            resp.HireDate = dr.SafeGetDateTime("HireDate");
                        }
                    }
                }
            }
            return resp;
        }

        public void SpEmployee(Employee employee)
        {
            using (var conn = new SqlConnection(Settings.Default.PayrollEntities))
            {
                conn.Open();
                var cmd = new SqlCommand("SpEmployee", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@EmployeeId", employee.EmployeeId);
                cmd.Parameters.AddWithValue("@FirstName", employee.FirstName);
                cmd.Parameters.AddWithValue("@LastName", employee.LastName);
                cmd.Parameters.AddWithValue("@Phone", employee.Phone);
                cmd.Parameters.AddWithValue("@Zip", employee.Zip);
                cmd.Parameters.AddWithValue("@HireDate", employee.HireDate);
                cmd.ExecuteNonQuery();
            }
        }
    }
}
