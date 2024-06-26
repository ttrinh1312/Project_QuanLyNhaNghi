using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace qlnn
{
    public partial class Form1 : Form
    {
        string chuoiketnoi = @"Data Source=LAPTOP-2DEEG365\SQLEXPRESS;Initial Catalog=quanlynhanghi;Integrated Security=True;";
        string sql;
        SqlConnection ketnoi;
        SqlCommand thuchien;
        SqlDataReader docdulieu;
        int i = 0;
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            ketnoi = new SqlConnection(chuoiketnoi); // Sử dụng biến ở phạm vi lớp, không khai báo lại
            hienthi();
        }

        public void hienthi()
        {
            listView2.Items.Clear();
            ketnoi.Open();
            sql = @"select MaPhong, LoaiPhong, TinhTrangPhong,DGTheoGio, DGTheoNgay from phong";
            thuchien = new SqlCommand(sql, ketnoi);
            docdulieu = thuchien.ExecuteReader();
            i=0;
            while (docdulieu.Read())
            {
                listView2.Items.Add(docdulieu[0].ToString());
                listView2.Items[i].SubItems.Add(docdulieu[1].ToString());
                listView2.Items[i].SubItems.Add(docdulieu[2].ToString());
                listView2.Items[i].SubItems.Add(docdulieu[3].ToString());
                listView2.Items[i].SubItems.Add(docdulieu[4].ToString());
                i++;
            }
            ketnoi.Close();
        }
        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            listView2.Items.Clear();
            ketnoi.Open();
            sql = @"Insert into Phong
                   values (N'"+txtmaphong.Text+@"',N'"+txtloaiphong.Text+@"' ,N'"+txttinhtrangphong.Text+@"',N'"+txtdongiatheogio.Text+@"',N'"+txtdongiatheongay.Text+@"')";
            thuchien = new SqlCommand(sql, ketnoi);
            thuchien.ExecuteNonQuery();
            ketnoi.Close();
            hienthi();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void listView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {

        }

        private void listView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Check if there are any selected items
            if (listView2.SelectedItems.Count > 0)
            {
                // Ensure that each subitem index is within bounds before accessing it
                if (listView2.SelectedItems[0].SubItems.Count > 0)
                    txtmaphong.Text = listView2.SelectedItems[0].SubItems[0].Text;

                if (listView2.SelectedItems[0].SubItems.Count > 1)
                    txtloaiphong.Text = listView2.SelectedItems[0].SubItems[1].Text;

                if (listView2.SelectedItems[0].SubItems.Count > 2)
                    txttinhtrangphong.Text = listView2.SelectedItems[0].SubItems[2].Text;

                if (listView2.SelectedItems[0].SubItems.Count > 3)
                    txtdongiatheogio.Text = listView2.SelectedItems[0].SubItems[3].Text;

                if (listView2.SelectedItems[0].SubItems.Count > 4)
                    txtdongiatheongay.Text = listView2.SelectedItems[0].SubItems[4].Text;
            }
            else
            {
                // Handle the case when there are no selected items, clear the text boxes, for example
                txtmaphong.Text = "";
                txtloaiphong.Text = "";
                txttinhtrangphong.Text = "";
                txtdongiatheogio.Text = "";
                txtdongiatheongay.Text = "";
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            listView2.Items.Clear();
            ketnoi.Open();

            // Build the update query dynamically based on the modified text boxes
            sql = "update Phong set ";

            if (!string.IsNullOrEmpty(txtloaiphong.Text))
                sql += "loaiphong = N'" + txtloaiphong.Text + "', ";

            if (!string.IsNullOrEmpty(txttinhtrangphong.Text))
                sql += "tinhtrangphong = N'" + txttinhtrangphong.Text + "', ";

            if (!string.IsNullOrEmpty(txtdongiatheogio.Text))
                sql += "dgtheogio = N'" + txtdongiatheogio.Text + "', ";

            if (!string.IsNullOrEmpty(txtdongiatheongay.Text))
                sql += "dgtheongay = N'" + txtdongiatheongay.Text + "', ";

            // Remove the trailing comma and add the condition for the WHERE clause
            sql = sql.TrimEnd(',', ' ') + " where maphong = N'" + txtmaphong.Text + "'";

            thuchien = new SqlCommand(sql, ketnoi);
            thuchien.ExecuteNonQuery();
            ketnoi.Close();
            hienthi();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            listView2.Items.Clear();
            ketnoi.Open();
            sql = @"delete Phong 
            where maphong = N'"+txtmaphong.Text+@"' ";
            thuchien = new SqlCommand(sql, ketnoi);
            thuchien.ExecuteNonQuery();
            ketnoi.Close();
            hienthi();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            listView2.Items.Clear();
            string searchText1 = txtmaphong.Text;
            string searchText2 = txttinhtrangphong.Text;
            string searchText3 = txtloaiphong.Text;
            string searchText4 = txtdongiatheogio.Text;
            string searchText5 = txtdongiatheongay.Text;// Fix the column name here

            if (!string.IsNullOrEmpty(searchText1) && !string.IsNullOrEmpty(searchText2))
            {
                sql = @"select * from Phong where maphong = N'" + txtmaphong.Text + @"' and tinhtrangphong = N'" + txttinhtrangphong.Text + @"' "; // Add the missing operator (=)
            }
            else if (!string.IsNullOrEmpty(searchText1))
            {
                sql = @"select * from Phong where maphong = N'" + txtmaphong.Text + @"' ";
            }
            else if (!string.IsNullOrEmpty(searchText2))
            {
                sql = @"select * from Phong where tinhtrangphong = N'" + txttinhtrangphong.Text + @"' ";
            }
            else if (!string.IsNullOrEmpty(searchText3))
            {
                sql = @"select * from Phong where loaiphong = N'" + txtloaiphong.Text + @"' ";
            }
            else if (!string.IsNullOrEmpty(searchText4))
            {
                sql = @"select * from Phong where dgtheogio = N'" + txtdongiatheogio.Text + @"' ";
            }
            else if (!string.IsNullOrEmpty(searchText5))
            {
                sql = @"select * from Phong where dgtheongay = N'" + txtdongiatheongay.Text + @"' ";
            }
            else
            {
                // Hiển thị thông báo nếu không có giá trị nào được nhập vào
                MessageBox.Show("Vui lòng nhập vào ít nhất một giá trị để tìm kiếm!");
                return; // Add a return statement to avoid executing the query if no values are entered
            }
            // Execute the query to get search results
            ketnoi.Open();
            thuchien = new SqlCommand(sql, ketnoi);
            docdulieu = thuchien.ExecuteReader();

            i = 0;

            while (docdulieu.Read())
            {
                listView2.Items.Add(docdulieu[0].ToString());
                listView2.Items[i].SubItems.Add(docdulieu[1].ToString());
                listView2.Items[i].SubItems.Add(docdulieu[2].ToString());
                listView2.Items[i].SubItems.Add(docdulieu[3].ToString());
                listView2.Items[i].SubItems.Add(docdulieu[4].ToString());
                i++;
            }

            ketnoi.Close();
        }


        private void button4_Click(object sender, EventArgs e)
        {
            DialogResult f = MessageBox.Show("Bạn có thực sự muốn thoát không?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
            if (f == DialogResult.Yes)
            {
                this.Close();
                Application.Exit();
            }
        }
    }
}
