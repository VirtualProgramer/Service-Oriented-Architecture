<%@ Page Language="C#" %>

<%@ Import Namespace="System.Net.Http" %>
<%@ Import Namespace="Newtonsoft.Json" %>
<%@ Import Namespace="Newtonsoft.Json.Linq" %>
<!DOCTYPE html>

<script runat="server">
    protected void Button1_Click(object sender, EventArgs e)
    {
        SchoolUtility su = new SchoolUtility();

        Repeater1.DataSource = su.GetAllSchools();
        Repeater1.DataBind();
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <asp:Repeater ID="Repeater1" runat="server">
                <HeaderTemplate>
                    <table class="w3-table-all w3-card-4">
                        <tr>
                            <th>學校名稱</th>
                            <th>郵遞區號</th>
                            <th>地址</th>
                            <th>Google Map</th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("school_name") %></td>
                        <td><%# Eval("postal_code") %></td>
                        <td><%# Eval("address") %></td>
                        <td>
                            <a href="https://www.google.com/maps/search/?api=1&query=<%# Eval("lat") %>,<%# Eval("lon") %>" target="_blank">
                                地圖</a>
                        </td>

                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>
