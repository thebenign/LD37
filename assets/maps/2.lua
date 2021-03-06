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
  nextobjectid = 36,
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
      tilecount = 9,
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
        0, 14, 14, 14, 14, 14, 14, 23, 14, 14, 14, 14, 14, 0,
        0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 0,
        0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 0,
        0, 14, 14, 14, 14, 14, 0, 0, 14, 14, 14, 14, 14, 0,
        0, 14, 14, 14, 14, 14, 0, 0, 14, 14, 14, 14, 14, 0,
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
        5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5,
        5, 0, 0, 0, 0, 21, 0, 0, 21, 0, 0, 0, 0, 5,
        12, 2, 2, 2, 2, 7, 0, 0, 8, 2, 2, 2, 2, 13,
        5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5,
        5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5,
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
          x = 32,
          y = 192,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 33,
          visible = true,
          properties = {}
        },
        {
          id = 15,
          name = "ice",
          type = "",
          shape = "rectangle",
          x = 360,
          y = 408,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 40,
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
          id = 25,
          name = "button",
          type = "",
          shape = "rectangle",
          x = 64,
          y = 320,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 34,
          visible = true,
          properties = {
            ["link"] = 1
          }
        },
        {
          id = 26,
          name = "button",
          type = "",
          shape = "rectangle",
          x = 352,
          y = 320,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 34,
          visible = true,
          properties = {
            ["link"] = 2
          }
        },
        {
          id = 27,
          name = "ice",
          type = "",
          shape = "rectangle",
          x = 304,
          y = 224,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 40,
          visible = true,
          properties = {}
        },
        {
          id = 28,
          name = "trap",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 256,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 39,
          visible = true,
          properties = {
            ["link"] = 1
          }
        },
        {
          id = 29,
          name = "trap",
          type = "",
          shape = "rectangle",
          x = 224,
          y = 256,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 39,
          visible = true,
          properties = {
            ["link"] = 2
          }
        },
        {
          id = 30,
          name = "trap",
          type = "",
          shape = "rectangle",
          x = 224,
          y = 224,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 39,
          visible = true,
          properties = {
            ["link"] = 1
          }
        },
        {
          id = 31,
          name = "trap",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 224,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 39,
          visible = true,
          properties = {
            ["link"] = 2
          }
        },
        {
          id = 32,
          name = "player",
          type = "",
          shape = "rectangle",
          x = 224,
          y = 416,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 44,
          visible = true,
          properties = {}
        },
        {
          id = 33,
          name = "fire",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 96,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 42,
          visible = true,
          properties = {}
        },
        {
          id = 34,
          name = "fire",
          type = "",
          shape = "rectangle",
          x = 224,
          y = 96,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 42,
          visible = true,
          properties = {}
        },
        {
          id = 35,
          name = "ice",
          type = "",
          shape = "rectangle",
          x = 72,
          y = 408,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 40,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
