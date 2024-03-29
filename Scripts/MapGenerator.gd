extends Spatial

var width = 300
var height = 300

var noise_texture_file
var noise_texture_data

func _ready():
	noise_texture_file = load("res://Images/noise_texture.tres")
	yield(noise_texture_file, "changed")
	noise_texture_data = noise_texture_file.get_data()
	noise_texture_data.lock()
	
	var st = SurfaceTool.new()
	st.begin(Mesh.PRIMITIVE_TRIANGLES)
	
	for x in range(width-1):
		for z in range(height-1):
			#A
			st.add_normal(Vector3(0, 1, 0))
			st.add_uv(Vector2(0, 0))
			st.add_vertex(Vector3(x, noise_texture_data.get_pixel(x, z).r * 10, z))
			
			#B
			st.add_normal(Vector3(0, 1, 0))
			st.add_uv(Vector2(0, 0))
			st.add_vertex(Vector3(x+1, noise_texture_data.get_pixel(x+1, z).r * 10, z))
		
			#C
			st.add_normal(Vector3(0, 1, 0))
			st.add_uv(Vector2(0, 0))
			st.add_vertex(Vector3(x, noise_texture_data.get_pixel(x, z+1).r * 10, z+1))
			
			#B
			st.add_normal(Vector3(0, 1, 0))
			st.add_uv(Vector2(0, 0))
			st.add_vertex(Vector3(x+1, noise_texture_data.get_pixel(x+1, z).r * 10, z))
			
			#D
			st.add_normal(Vector3(0, 1, 0))
			st.add_uv(Vector2(0, 0))
			st.add_vertex(Vector3(x+1, noise_texture_data.get_pixel(x+1, z+1).r * 10, z+1))
			
			#C
			st.add_normal(Vector3(0, 1, 0))
			st.add_uv(Vector2(0, 0))
			st.add_vertex(Vector3(x, noise_texture_data.get_pixel(x, z+1).r * 10, z+1))

	var mesh = st.commit()
	$StaticBody/MeshInstance.mesh = mesh
	$StaticBody/MeshInstance.material_override = load("res://Materials/Map_material.tres")
	$StaticBody/CollisionShape.shape = mesh.create_trimesh_shape()
