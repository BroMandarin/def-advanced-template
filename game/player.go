components {
  id: "script"
  component: "/game/player.script"
}
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "default_animation: \"green\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/blockout/endesga.tilesource\"\n"
  "}\n"
  ""
  scale {
    x: 16.0
    y: 16.0
  }
}
