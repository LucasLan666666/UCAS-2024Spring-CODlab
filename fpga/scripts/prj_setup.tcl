# setting up the project
create_project ${project_name} -force -dir "./${project_name}/${target_path}" -part ${device}

if {${bd_part} != ""} {
  set_property board_part ${bd_part} [current_project]
}

