<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MultipleSelectBoxes.aspx.cs" Inherits="MultipleSelectBoxes" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function Add() {

            var source = document.getElementById('ListBox1');

            var target = document.getElementById('ListBox2');

            var count = source.length;

            for (var i = count - 1; i >= 0; i--) {

                var item = source.options[i];

                if (item.selected) {

                    source.remove(i);

                    target.add(item);

                }

            }

        }

        function AddAll() {

            var source = document.getElementById('ListBox1');

            var target = document.getElementById('ListBox2');

            var count = source.length;

            for (var i = count - 1; i >= 0; i--) {

                var item = source.options[i];

                source.remove(i);

                target.add(item);

            }

        }

        function Remove() {

            var source = document.getElementById('ListBox2');

            var target = document.getElementById('ListBox1');

            var count = source.length;

            for (var i = count - 1; i >= 0; i--) {

                var item = source.options[i];

                if (item.selected) {

                    source.remove(i);

                    target.add(item);

                }

            }

        }

        function RemoveAll() {

            var source = document.getElementById('ListBox2');

            var target = document.getElementById('ListBox1');

            var count = source.length;

            for (var i = count - 1; i >= 0; i--) {

                var item = source.options[i];

                source.remove(i);

                target.add(item);

            }

        }
    
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:ListBox ID="ListBox1" runat="server" SelectionMode="Multiple">

            <asp:ListItem>1</asp:ListItem>

            <asp:ListItem>2</asp:ListItem>

            <asp:ListItem>3</asp:ListItem>

        </asp:ListBox>

 

        <input type="button" OnClick="Add()" value="Add" />

        <input type="button" OnClick="AddAll()" value="Add All" />

        <input type="button" OnClick="Remove()" value="Remove" />

        <input type="button" OnClick="RemoveAll()" value="Remove All" />

 

        <asp:ListBox ID="ListBox2" runat="server" SelectionMode="Multiple"></asp:ListBox>
    </div>
    </form>
</body>
</html>
