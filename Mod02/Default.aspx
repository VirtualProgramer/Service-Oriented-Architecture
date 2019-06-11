<%@ Page Language="C#" %>

<%@ Import Namespace="System.Net.Http" %>
<!DOCTYPE html>

<script runat="server">
    protected void Button1_Click(object sender, EventArgs e)
    {
        HttpClient client = new HttpClient();
        client.BaseAddress = new Uri("https://data.taipei/");

        HttpResponseMessage resp = client.GetAsync("opendata/datalist/apiAccess?scope=resourceAquire&rid=a1c35319-c67d-4c7b-86fe-442874cb3d79").Result;

        if (resp.IsSuccessStatusCode)
        {
            Label1.Text = resp.Content.ReadAsStringAsync().Result;
        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </div>
    </form>
</body>
</html>
