local iron = require('iron')

iron.core.add_repl_definitions {
  r = {
    radian = {
      command = {"radian"}
    }
  },
  rmarkdown = {
    rmarkdown_repl = {
      command = "radian"
    }
  }
}

iron.core.set_config {
  preferred = {
    r = "radian",
    python = "ipython",
    rmarkdown = "rmarkdown_repl",
  },
  repl_open_cmd = "20split"
}

_G.my_iron_open_fn = function(orientation)
  local old_config = iron.config.repl_open_cmd
  iron.core.set_config{repl_open_cmd = orientation}
  iron.core.repl_for(vim.api.nvim_buf_get_option(0, "ft"))
  iron.core.set_config{repl_open_cmd = old_config}
end
