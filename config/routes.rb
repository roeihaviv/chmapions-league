Rails.application.routes.draw do



  # Routes for the Final stadium resource:

  # CREATE
  post("/insert_final_stadium", { :controller => "final_stadia", :action => "create" })
          
  # READ
  get("/final_stadia", { :controller => "final_stadia", :action => "index" })
  
  get("/final_stadia/:path_id", { :controller => "final_stadia", :action => "show" })
  
  # UPDATE
  
  post("/modify_final_stadium/:path_id", { :controller => "final_stadia", :action => "update" })
  
  # DELETE
  get("/delete_final_stadium/:path_id", { :controller => "final_stadia", :action => "destroy" })

  #------------------------------

  # Routes for the Coach resource:

  # CREATE
  post("/insert_coach", { :controller => "coaches", :action => "create" })
          
  # READ
  get("/coaches", { :controller => "coaches", :action => "index" })
  
  get("/coaches/:path_id", { :controller => "coaches", :action => "show" })
  
  # UPDATE
  
  post("/modify_coach/:path_id", { :controller => "coaches", :action => "update" })
  
  # DELETE
  get("/delete_coach/:path_id", { :controller => "coaches", :action => "destroy" })

  #------------------------------

  # Routes for the Top scorer resource:

  # CREATE
  post("/insert_top_scorer", { :controller => "top_scorers", :action => "create" })
          
  # READ
  get("/top_scorers", { :controller => "top_scorers", :action => "index" })
  
  get("/top_scorers/:path_id", { :controller => "top_scorers", :action => "show" })
  
  # UPDATE
  
  post("/modify_top_scorer/:path_id", { :controller => "top_scorers", :action => "update" })
  
  # DELETE
  get("/delete_top_scorer/:path_id", { :controller => "top_scorers", :action => "destroy" })

  #------------------------------

  # Routes for the Season resource:

  # CREATE
  post("/insert_season", { :controller => "seasons", :action => "create" })
          
  # READ
  get("/seasons", { :controller => "seasons", :action => "index" })
  
  get("/seasons/:path_id", { :controller => "seasons", :action => "show" })
  
  # UPDATE
  
  post("/modify_season/:path_id", { :controller => "seasons", :action => "update" })
  
  # DELETE
  get("/delete_season/:path_id", { :controller => "seasons", :action => "destroy" })

  #------------------------------

  # Routes for the Club resource:

  # CREATE
  post("/insert_club", { :controller => "clubs", :action => "create" })
          
  # READ
  get("/", { :controller => "clubs", :action => "index" })
  
  get("/clubs", { :controller => "clubs", :action => "index" })
  
  get("/clubs/:path_id", { :controller => "clubs", :action => "show" })
  
  # UPDATE
  
  post("/modify_club/:path_id", { :controller => "clubs", :action => "update" })
  
  # DELETE
  get("/delete_club/:path_id", { :controller => "clubs", :action => "destroy" })

  #------------------------------

end
