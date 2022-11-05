# vga64
Adaptador directo de hdmi a vga para la atlasfpga. Diseño usando Kicad 6.0

La profundidad actual que conseguimos de 64 colores usando 2 bits por color, por eso la llamamos vga64 aunque también podría llamarse vga222.

El adaptador puede ser usado solo o con una adaptador vga<->scart si el core lo permite sin problemas.

![FotoFrontal_vga64](https://github.com/AtlasFPGA/vga64/blob/main/photos/VGADIRECTO_front.png?raw=true)

# Esquemas
![Esquema vga64](https://github.com/AtlasFPGA/vga64/raw/main/photos/VGADIRECTO_schema.png?raw=true)[https://github.com/AtlasFPGA/vga64/blob/main/VGADIRECTO.pdf]

# Material
* 1 x PCB vga
* 1 x conector HDMI 
* 1 x conector VGA
* 1 x resistencia 1206 -  1k ohm
* 3 x resistencia 1206 - 820 ohm 
* 3 x resistencia 1206 - 240 ohm

# URL compras
* 1 x PCB lo hicimos en la página https://jlcpcb.com/ usando los gerbers: https://github.com/AtlasFPGA/vga64/raw/main/gerbers_vga64_atlas_1206.zip
* 1 x HDMI modelo 10029449-111RLF -> https://es.farnell.com/amphenol-icc-fci/10029449-111rlf/conector-hdmi-19-pos-hembra-smt/dp/2751197
* 1 x Conector VGA -> https://es.rs-online.com/web/p/conectores-d-sub/6740971
* 1 x resistencia 1206 -  1k ohm -> https://es.farnell.com/multicomp-pro/mp003719/res-1k-1-0-25w-1206-pel-c-gruesa/dp/3392916
* 3 x resistencia 1206 - 820 ohm -> https://es.farnell.com/multicomp-pro/mp003717/res-820r-1-0-25w-1206-pel-c-gruesa/dp/3392914
* 3 x resistencia 1206 - 240 ohm -> https://es.farnell.com/multicomp-pro/mp003703/res-240r-1-0-25w-1206-pel-c-gruesa/dp/3392898

# Equivalencias de pineado para cambiar en Quartus
```
## HDMI Direct ATLAS_V002_CYC1000                                         ### VGA222 adaptador de 64Colores
set_location_assignment PIN_L16 -to TMDS[0] # CLK-                        ### HS
set_location_assignment PIN_L15 -to TMDS[1] # CLK+ # clock channel        ### VS
set_location_assignment PIN_P1 -to TMDS[2]  # 0-                          ### BLUE[0]
set_location_assignment PIN_P2 -to TMDS[3]  # 0+   # blue channel         ### BLUE[1]
set_location_assignment PIN_J1 -to TMDS[4]  # 1-                          ### GREEN[0]
set_location_assignment PIN_J2 -to TMDS[5]  # 1+   # green channel        ### GREEN[1]
set_location_assignment PIN_N1 -to TMDS[6]  # 2-                          ### RED[0]
set_location_assignment PIN_N2 -to TMDS[7]  # 2+   # red channel          ### RED[1]
```

Proyecto original de @subcriticalia y @Nabateo.

Gracias a @Rhoderik por el convertir el proyecto a smd 1206 y a @Somhi (@somhic) por la ayuda / revisión como siempre.
