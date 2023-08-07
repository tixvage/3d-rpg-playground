extends MeshInstance3D

func createMesh(pointArray:Array):
	#				 
	#         7		 
	# 4             6
	#       5		 
	#				 
	#         3		 
	# 0             2
	#       1		 
	# Numbers of the voxels!
	
	pointArray[0] = 1
	pointArray[1] = 1
	pointArray[2] = 1
	pointArray[3] = 1
	pointArray[4] = 0
	pointArray[5] = 0
	pointArray[6] = 0
	pointArray[7] = 0

	var vertices = PackedVector3Array()
	
	
	if(pointArray == [1, 1, 1, 1, 0, 0, 0, 0]):
		vertices.push_back(Vector3(-1, 0, -1))
		vertices.push_back(Vector3(1, 0, -1))
		vertices.push_back(Vector3(-1, 0, 1))
		
		vertices.push_back(Vector3(-1, 0, 1))
		vertices.push_back(Vector3(1, 0, -1))
		vertices.push_back(Vector3(1, 0, 1))
		pass
	
	var tmpMesh = ArrayMesh.new()
	var arrays = []
	
	arrays.resize(Mesh.ARRAY_MAX)
	arrays[Mesh.ARRAY_VERTEX] = vertices
	
	tmpMesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)
	
	#0001
	
	mesh = tmpMesh
	var path = ""
	for p in pointArray:
		var i = 1
		while p > 10:
			p -= p % 10
			p = p / 10
			i += 1
		for j in 4 - i:
			path += "0"
		path += str(p) + "-"
	path = path.left(path.length() - 1)
	ResourceSaver.save(tmpMesh, "res://GeneratedMesh/Floor/" + path + ".tres")


func _ready():
	createMesh([0,0,0,0,0,0,0,0])
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
