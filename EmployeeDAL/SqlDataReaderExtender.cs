using System;
using System.Data.SqlClient;

namespace EmployeeDAL
{
    public static class SqlDataReaderExtender
    {
        #region GetValueByColumnName
        public static string SafeGetString(this SqlDataReader reader, string colName)
        {
            return SafeGetString(reader, reader.GetOrdinal(colName));
        }

        public static int SafeGetInt32(this SqlDataReader reader, string colName)
        {
            return SafeGetInt32(reader, reader.GetOrdinal(colName));
        }

        public static long SafeGetInt64(this SqlDataReader reader, string colName)
        {
            return SafeGetInt64(reader, reader.GetOrdinal(colName));
        }

        public static DateTime SafeGetDateTime(this SqlDataReader reader, string colName)
        {
            return SafeGetDateTime(reader, reader.GetOrdinal(colName));
        }

        public static TimeSpan SafeGetTimeSpan(this SqlDataReader reader, string colName)
        {
            return SafeGetTimeSpan(reader, reader.GetOrdinal(colName));
        }

        public static decimal SafeGetDecimal(this SqlDataReader reader, string colName)
        {
            return SafeGetDecimal(reader, reader.GetOrdinal(colName));
        }

        public static bool SafeGetBoolean(this SqlDataReader reader, string colName)
        {
            return SafeGetBoolean(reader, reader.GetOrdinal(colName));
        }
        #endregion

        #region GetValueByColumnIndex
        public static string SafeGetString(this SqlDataReader reader, int colIndex)
        {
            return !reader.IsDBNull(colIndex) ? reader.GetString(colIndex) : string.Empty;
        }

        public static int SafeGetInt32(this SqlDataReader reader, int colIndex)
        {
            return !reader.IsDBNull(colIndex) ? reader.GetInt32(colIndex) : 0;
        }

        public static long SafeGetInt64(this SqlDataReader reader, int colIndex)
        {
            return !reader.IsDBNull(colIndex) ? reader.GetInt64(colIndex) : 0;
        }

        public static DateTime SafeGetDateTime(this SqlDataReader reader, int colIndex)
        {
            return !reader.IsDBNull(colIndex) ? reader.GetDateTime(colIndex) : DateTime.MinValue;
        }

        public static TimeSpan SafeGetTimeSpan(this SqlDataReader reader, int colIndex)
        {
            return !reader.IsDBNull(colIndex) ? reader.GetTimeSpan(colIndex) : TimeSpan.MinValue;
        }

        public static decimal SafeGetDecimal(this SqlDataReader reader, int colIndex)
        {
            return !reader.IsDBNull(colIndex) ? reader.GetDecimal(colIndex) : 0;
        }

        public static bool SafeGetBoolean(this SqlDataReader reader, int colIndex)
        {
            return !reader.IsDBNull(colIndex) && reader.GetBoolean(colIndex);
        }
        #endregion
    }

}
