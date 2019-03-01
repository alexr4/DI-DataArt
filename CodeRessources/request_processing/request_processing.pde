import http.requests.*;

public void setup() 
{
  size(400, 400);
  smooth();

  int rows = 100;
  String srequest = "https://opendata.paris.fr/api/records/1.0/search/?dataset=les-arbres&rows=";
  String erequest = "&refine.arrondissement=PARIS+17E+ARRDT";
  GetRequest get = new GetRequest(srequest+rows+erequest);//"http://connect.doodle3d.com/api/list.example");
  get.send(); // program will wait untill the request is completed
  //println("response: " + get.getContent());

  JSONObject response = parseJSONObject(get.getContent());
  rows = response.getInt("nhits");

  JSONArray datas = response.getJSONArray("records");
  try {
    for (int i=0; i<datas.size(); i++) {
      JSONObject data = datas.getJSONObject(i);
      //println("\tdatasetid: " + box.getString("datasetid"));
      println(i, "\tEspece: " + data.getJSONObject("fields").getString("libellefrancais"));
    }
  }
  catch(Exception e) {
  }
}
