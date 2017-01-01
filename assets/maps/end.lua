return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "0.17.0",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 14,
  height = 14,
  tilewidth = 32,
  tileheight = 32,
  nextobjectid = 35,
  properties = {},
  tilesets = {
    {
      name = "aynNDpb",
      firstgid = 1,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "aynNDpb.png",
      imagewidth = 256,
      imageheight = 128,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 32,
      tiles = {}
    },
    {
      name = "entities",
      firstgid = 33,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 10,
      tiles = {
        {
          id = 0,
          image = "13 - Ic7yDv4.png",
          width = 32,
          height = 32
        },
        {
          id = 1,
          image = "01 - KjpH0ta.png",
          width = 32,
          height = 32
        },
        {
          id = 5,
          image = "trap-closed.png",
          width = 32,
          height = 32
        },
        {
          id = 6,
          image = "trap-open.png",
          width = 32,
          height = 32
        },
        {
          id = 7,
          image = "ice_small.png",
          width = 16,
          height = 16
        },
        {
          id = 8,
          image = "window.png",
          width = 32,
          height = 32
        },
        {
          id = 9,
          image = "fire.png",
          width = 32,
          height = 32
        },
        {
          id = 10,
          image = "warn-tile.png",
          width = 32,
          height = 32
        },
        {
          id = 11,
          image = "player.png",
          width = 32,
          height = 32
        },
        {
          id = 12,
          image = "butterfly.png",
          width = 32,
          height = 32
        }
      }
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "Tile Layer 2",
      x = 0,
      y = 0,
      width = 14,
      height = 14,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {
        ["z"] = 1
      },
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 0,
        0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 0,
        0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 0,
        0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 0,
        0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 0,
        0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 0,
        0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 0,
        0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 0,
        0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 0,
        0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 0,
        0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 0,
        0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      name = "Tile Layer 1",
      x = 0,
      y = 0,
      width = 14,
      height = 14,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {
        ["collide"] = true,
        ["z"] = 2
      },
      encoding = "lua",
      data = {
        4, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3,
        5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5,
        5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5,
        5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5,
        5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5,
        5, 0, 0, 0, 4, 2, 2, 2, 3, 0, 0, 0, 0, 5,
        5, 0, 0, 0, 5, 0, 0, 0, 5, 0, 0, 0, 0, 5,
        5, 0, 0, 0, 5, 0, 0, 0, 5, 0, 0, 0, 0, 5,
        5, 0, 0, 0, 5, 0, 0, 0, 5, 0, 0, 0, 0, 5,
        5, 0, 0, 0, 8, 2, 2, 2, 7, 0, 0, 0, 0, 5,
        5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5,
        5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5,
        5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5,
        8, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 7
      }
    },
    {
      type = "objectgroup",
      name = "Object Layer 1",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 2,
          name = "guy",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 224,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 33,
          visible = true,
          properties = {}
        },
        {
          id = 17,
          name = "hud",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 32,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 41,
          visible = true,
          properties = {
            ["ignore_position"] = true
          }
        },
        {
          id = 32,
          name = "player",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 288,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 44,
          visible = true,
          properties = {}
        },
        {
          id = 34,
          name = "butterfly_entity",
          type = "",
          shape = "rectangle",
          x = 384,
          y = 256,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 45,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
