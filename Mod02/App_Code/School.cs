using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;

/// <summary>
/// Summary description for Schoolcs
/// </summary>
public class School
{
    public string school { get; set; }
    public string telephone { get; set; }
    public string school_name { get; set; }
    public string postal_code { get; set; }
    public string address { get; set; }
    public string lat { get; set; }
    public string lon { get; set; }
}

public class SchoolUtility
{
    public List<School> GetAllSchools()
    {
        HttpClient client = new HttpClient();
        client.BaseAddress = new Uri("https://data.taipei/");

        HttpResponseMessage resp = client.GetAsync("opendata/datalist/apiAccess?scope=resourceAquire&rid=a1c35319-c67d-4c7b-86fe-442874cb3d79").Result;

        if (resp.IsSuccessStatusCode)
        {
            string jsonString = resp.Content.ReadAsStringAsync().Result;

            JObject obj = JsonConvert.DeserializeObject<JObject>(jsonString);

            //Label1.Text = obj["result"]["results"].ToString();

            string schoolsString = obj["result"]["results"].ToString();

            return JsonConvert.DeserializeObject<List<School>>(schoolsString);
        }
        else
        {
            return null;
        }
    }
}
