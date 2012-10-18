import java.util.Hashtable;
import java.util.List;


public class ObjStructure {
	final String delama = "^"; //the string for separating each value
	String objID = null;  //the ID of this object
	String takenTime = null;  //taken time of the picture
	String imgWebSite = null;  //the picture web site
	String objType = null;  //the type of this object
	
	public ObjStructure(String objID, String takenTime, String imgWebSite, String objType)
	{
		this.objID = objID;
		this.takenTime = takenTime;
		this.imgWebSite = imgWebSite;
		this.objType = objType;
	}

	public String GET001_ObjType() {
		return objType;
	}

	public String GET002_ObjID() {
		return objID;
	}

	public String GET003_TakenTime() {
		return takenTime;
	}

	public String GET004_ImgWebSite() {
		return imgWebSite;
	}
	
	public String ACT001_getObjInfo() {
		return this.objID + this.delama + 
			   this.takenTime + this.delama +
			   this.imgWebSite + this.delama +
			   this.objType;
	}
}

class HashObjStr extends Hashtable<String, ObjStructure> {
	
	public void ACT001_add(String refID, String objID, String takenTime, String imgWebSite, String objType){
		ObjStructure obj = new ObjStructure(objID, takenTime, imgWebSite, objType);
		this.put(refID, obj);
	}
	
	public String ACT002_get(List<Integer> listID){
		String listInfo = "";
		int index = 0;
		while(index < listID.size())
		{
			listInfo = listInfo + this.get(Integer.toString(listID.get(index))).ACT001_getObjInfo() + "\n";
			index = index + 1;
		}
		return listInfo;
	}
}