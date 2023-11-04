package como.servelet.dao;


import static com.mongodb.MongoClientSettings.getDefaultCodecRegistry;
import static com.mongodb.client.model.Filters.eq;
import static org.bson.codecs.configuration.CodecRegistries.fromProviders;
import static org.bson.codecs.configuration.CodecRegistries.fromRegistries;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JOptionPane;

import org.bson.Document;
import org.bson.codecs.configuration.CodecProvider;
import org.bson.codecs.configuration.CodecRegistry;
import org.bson.codecs.pojo.PojoCodecProvider;
import org.bson.conversions.Bson;
import org.bson.types.ObjectId;

import com.mongodb.MongoException;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Projections;
import com.mongodb.client.model.Sorts;
import com.mongodb.client.model.Updates;
import com.mongodb.client.result.DeleteResult;
import com.mongodb.client.result.InsertOneResult;
import com.mongodb.client.result.UpdateResult;

import como.servelet.model.Juguete;

/**
 * AbstractDAO.java This DAO class provides CRUD database operations for the
 * table users in the database.
 * 
 * @author Ramesh Fadatare
 *
 */
public class JugueteDAO {
	
	
	String base="pruebas";
	String coleccion="juguetes";
	String uri = "mongodb://localhost:27017";
    Bson projectionFields = Projections.fields(
            Projections.include("nombre", "descripcion","precio", "piezas"));
    
	CodecProvider pojoCodecProvider = PojoCodecProvider.builder().automatic(true).build();
    CodecRegistry pojoCodecRegistry = fromRegistries(getDefaultCodecRegistry(), fromProviders(pojoCodecProvider));
    
   
    
    public JugueteDAO() {}

 


    public void insertJuguete(Juguete juguete) throws SQLException {
        //System.out.println(juguete.getNombre());
        // try-with-resource statement will auto close the connection.
    	

    	try (MongoClient mongoClient = MongoClients.create(uri)) {
            MongoDatabase database = mongoClient.getDatabase(base).withCodecRegistry(pojoCodecRegistry);
              
    	MongoCollection<Document> collection = database.getCollection(coleccion);

      //  System.out.println(juguete.getNombre());
            InsertOneResult result = collection.insertOne(new Document()
                    .append("_id", new ObjectId())
                    .append("nombre",juguete.getNombre())
                    .append("descripcion", juguete.getDescripcion())
                    .append("piezas", juguete.getPiezas())
                    .append("precio", juguete.getPrecio())
                    );
            System.err.println("Juguete Registrado id: " + result.getInsertedId()+"\n");
        } catch (MongoException me) {
            System.err.println("Unable to insert due to an error: " + me+"\n");
        }
		
       
    }

    public Juguete selectJuguete(String id) {
        Juguete juguete = null;
        // Step 1: Establishing a Connection
        
        try (MongoClient mongoClient = MongoClients.create(uri)) {
            MongoDatabase database = mongoClient.getDatabase(base).withCodecRegistry(pojoCodecRegistry);
            MongoCollection<Document> collection = database.getCollection(coleccion);
            
    		
            Document dato= collection.find(new Document("_id",new ObjectId(id))).first();
           // String id = dato.get("_id").toString();
        	String nombre = dato.get("nombre").toString();
           String descripcion = dato.get("descripcion").toString();
           String piezas =dato.get("piezas").toString();
           int precio=Integer.parseInt(dato.get("precio").toString());
           // System.out.println(id);
           
           
           //juguete).add(new  Juguete(id,nombre,piezas,descripcion, precio));

            // Step 4: Process the ResultSet object.
            
            juguete = new Juguete(id,nombre,piezas,descripcion, precio);
            
        } catch (Exception e) {
            //printSQLException(e);
        }
        return juguete;
    }

    public List < Juguete > selectAllJuguetes() {

        // using try-with-resources to avoid closing resources (boiler plate code)
        List < Juguete > juguetes = new ArrayList < > ();
        
        try (MongoClient mongoClient = MongoClients.create(uri)) {
            MongoDatabase database = mongoClient.getDatabase(base).withCodecRegistry(pojoCodecRegistry);
            MongoCollection<Document> collection = database.getCollection(coleccion);
          
        MongoCursor<Document> rs = collection.find()
                .projection(projectionFields)
                .sort(Sorts.descending("nombre"))
                .iterator();
        
      
            // Step 4: Process the ResultSet object.
            while (rs.hasNext()) {
            	
            	
            	Document dato=rs.next();
//            	System.out.println(dato.get("_id"));

            	String id = dato.get("_id").toString();
            	String nombre = dato.get("nombre").toString();
               String descripcion = dato.get("descripcion").toString();
               String piezas =dato.get("piezas").toString();
               int precio=Integer.parseInt(dato.get("precio").toString());
               // System.out.println(id);
                
                juguetes.add(new  Juguete(id,nombre,piezas,descripcion, precio));
              
            }
        } catch (Exception e) {
           
        }
        return juguetes;
    }

    public boolean deleteJuguete(String id) throws SQLException {
        boolean rowDeleted=false;

	    try (MongoClient mongoClient = MongoClients.create(uri)) {
            MongoDatabase database = mongoClient.getDatabase(base).withCodecRegistry(pojoCodecRegistry);
            MongoCollection<Juguete> collection = database.getCollection(coleccion,Juguete.class);
            System.out.println();
	    	DeleteResult result = collection.deleteOne(new Document("_id",new ObjectId(id)));
	    	
	    	return true;
	    } catch (MongoException me) {
            System.err.println("Unable to update due to an error: " + me+"\n");
        }
        return rowDeleted;
    }

    public boolean updateJuguete(Juguete juguete) throws SQLException {
        boolean rowUpdated=false;
       
        
        try (MongoClient mongoClient = MongoClients.create(uri)) {
            MongoDatabase database = mongoClient.getDatabase(base).withCodecRegistry(pojoCodecRegistry);
            MongoCollection<Juguete> collection = database.getCollection(coleccion,Juguete.class);
  
	    	UpdateResult result = collection.updateOne(new Document("_id",new ObjectId(juguete.getId().toString())),
	    			Updates.combine(Updates.set("nombre",juguete.getNombre()),
	    			Updates.set("descripcion",juguete.getDescripcion()),
	    			Updates.set("pezas",juguete.getPiezas()),
	    			Updates.set("precio",juguete.getPrecio())));
	    	
	    	return true;
	    }
        
        //System.out.println(juguete.getId());
        
       // return rowUpdated;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}