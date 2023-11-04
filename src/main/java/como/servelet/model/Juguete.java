package como.servelet.model;

public class Juguete {

	protected String id;
	  protected String nombre;
	    protected String piezas;
	    protected String descripcion;
	    protected int precio;
	    
	  public Juguete() {}
	    
	  public Juguete(String id, String nombre, String piezas, String descripcion, int precio) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.piezas = piezas;
		this.descripcion = descripcion;
		this.precio = precio;
	}

	  
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getNombre() {
			return nombre;
		}
		public void setNombre(String nombre) {
			this.nombre = nombre;
		}
		public String getPiezas() {
			return piezas;
		}
		public void setPiezas(String piezas) {
			this.piezas = piezas;
		}
		public String getDescripcion() {
			return descripcion;
		}
		public void setDescripcion(String descripcion) {
			this.descripcion = descripcion;
		}
		public int getPrecio() {
			return precio;
		}
		public void setPrecio(int precio) {
			this.precio = precio;
		}
}
