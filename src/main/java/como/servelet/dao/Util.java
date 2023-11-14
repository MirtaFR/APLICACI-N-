package como.servelet.dao;

import java.util.ArrayList;
import java.util.List;
 
import org.bson.Document;
import org.bson.types.ObjectId;

import com.mongodb.BasicDBObject;
import com.mongodb.MongoException;
import com.mongodb.client.MongoClient;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.result.InsertOneResult;
 
public class Util {
 
    // Method to make a connection to the mongodb server listening on a default port
    private static MongoClient getConnection() {
       // int port_no = 27017;
        String url = "mongodb://localhost:27017";
 
        MongoClient mongoClntObj = MongoClients.create(url);
        return mongoClntObj;
    }
 
    // Method to search a user in the mongodb
    public static boolean searchUserInDb(String loginId, String loginPwd) {
        boolean user_found = false;
        String db_name = "jugueteria",
                db_collection_name = "usuarios";
 
        // Get the mongodb connection
        MongoDatabase db = getConnection().getDatabase(db_name);
 
        // Get the mongodb collection.
        MongoCollection col = db.getCollection(db_collection_name);
 
        // Get the particular record from the mongodb collection        
        List obj = new ArrayList();
        obj.add(new BasicDBObject("email", loginId));
        obj.add(new BasicDBObject("password", loginPwd));
 
        // Form a where query
        BasicDBObject whereQuery = new BasicDBObject();
        whereQuery.put("$and", obj);
        System.out.println("Sql query is?= " + whereQuery.toString());
 
        
        Document cursor = (Document) col.find(whereQuery).first();
		if(cursor!=null)
			return true;
        
        return user_found;
    }
    public static boolean insertUserInDb(String loginId, String loginPwd) {
        boolean user_found = false;
        String db_name = "jugueteria",
                db_collection_name = "usuarios";
 
        // Get the mongodb connection
        MongoDatabase db = getConnection().getDatabase(db_name);
 
        // Get the mongodb collection.
        MongoCollection collection = db.getCollection(db_collection_name);
 
		
		
		try {
           collection.insertOne(new Document()
                    .append("_id", new ObjectId())
                    .append("email", loginId)
                    .append("password", loginPwd));
            return true;
        } catch (MongoException me) {
            System.err.println("Unable to insert due to an error: " + me+"\n");
        }
		
        
        return user_found;
    }
    
}