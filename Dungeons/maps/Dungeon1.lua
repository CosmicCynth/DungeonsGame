return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.11.0",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 80,
  height = 45,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 6,
  nextobjectid = 30,
  properties = {},
  tilesets = {
    {
      name = "FloorSet",
      firstgid = 1,
      class = "",
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 7,
      image = "atlas_floor-16x16.png",
      imagewidth = 112,
      imageheight = 112,
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      wangsets = {},
      tilecount = 49,
      tiles = {}
    },
    {
      name = "WallSet",
      firstgid = 50,
      class = "",
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 12,
      image = "atlas_walls_low-16x16.png",
      imagewidth = 192,
      imageheight = 64,
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      wangsets = {},
      tilecount = 48,
      tiles = {}
    },
    {
      name = "MiscSet",
      firstgid = 98,
      class = "",
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 32,
      image = "0x72_DungeonTilesetII_v1.7.png",
      imagewidth = 512,
      imageheight = 512,
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      wangsets = {},
      tilecount = 1024,
      tiles = {}
    },
    {
      name = "Canon",
      firstgid = 1122,
      class = "",
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 4,
      image = "../sprites/Canon.png",
      imagewidth = 64,
      imageheight = 32,
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      wangsets = {},
      tilecount = 8,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 80,
      height = 45,
      id = 4,
      name = "Ground",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJzt1yESwDAIBEDIC/r/19bHpKICyIr1N4EJkBGRAACbp0AG1AGoaxXIAMB83eZNt7zTuJ/uoM4AwB/sFGfuG6AD/zkdmKneGL7Qx0xgNwOA2l7DHA6B"
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 80,
      height = 45,
      id = 5,
      name = "Canon",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJzt27sJgFAQRNENrNS/XVi6IxYgYvAEz4HJl5tvFbQzdbWP2ZD1Wet7vi6NKq0qzc52taXZmi3ZrN+tNKq0qvVqBwAAAAAAAAAAAADAT/hfeMb/wjv+F/iSA+tIFTE="
    }
  }
}
