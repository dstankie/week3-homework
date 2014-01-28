Dice::Application.routes.draw do

  get("/dice", { :controller => "dice", :action => "new_game"})
  get("/dice/roll", { :controller => "dice", :action => "new_roll"})

end
