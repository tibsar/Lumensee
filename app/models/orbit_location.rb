class OrbitLocation
  FLATNESS = (1.0/298.257)
  SEMI_MAJOR_AXIS = 6378.1363
  PHI_NAUGHT = 1.6180339887499

  def calculate_plane(location) 
    lat = location["latitude"]
    lon = location["longitude"]
    delta_phi = lat - PHI_NAUGHT

    local_radius = (1.0 - (FLATNESS * (Math.sin(lat)^2))) * SEMI_MAJOR_AXIS
    phi_radius = local_radius * Math.cos(lat)
    a = local_radius * sin(delta_phi)
    b = phi_radius * (1 - Math.cos(delta_phi)) * Math.sin(PHI_NAUGHT)
    c = phi_radius * Math.sin(delta_phi)

    #<a, b, c> - normal to plane 

    # (point to test) dot (plane normal) = 0 => Point is on the plane
    # (point to test) dot (plane normal) > 0 => Point is on the same side as the normal vector
    # (point to test) dot (plane normal) < 0 => Point is on the opposite side of the normal vector
  end

end
