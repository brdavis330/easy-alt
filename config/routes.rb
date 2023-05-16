Rails.application.routes.draw do
  root to: "application#root"
  #root to: "appplication#about"
  # Routes for the Message resource:

  # CREATE
  post("/insert_message", { :controller => "messages", :action => "create" })

  # READ
  get("/messages", { :controller => "messages", :action => "index" })

  get("/messages/:path_id", { :controller => "messages", :action => "show" })

  # UPDATE

  post("/modify_message/:path_id", { :controller => "messages", :action => "update" })

  # DELETE
  get("/delete_message/:path_id", { :controller => "messages", :action => "destroy" })

  #------------------------------

  # Routes for the Ticket resource:

  # CREATE
  post("/insert_ticket", { :controller => "tickets", :action => "create" })

  # READ
  get("/tickets", { :controller => "tickets", :action => "index" })

  get("/tickets/:path_id", { :controller => "tickets", :action => "show" })

  # UPDATE

  post("/modify_ticket/:path_id", { :controller => "tickets", :action => "update" })

  # DELETE
  get("/delete_ticket/:path_id", { :controller => "tickets", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create" })

  # EDIT PROFILE FORM
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })

  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })

  # SIGN OUT
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })

  #------------------------------
  #ABOUT 
  get("/about", { :controller => "user_authentication", :action => "show" })

  #REDIRECTIONS

  #get("/user_sign_in"), redirect_to: ("/messages")

  #get("/user_sign_up"), redirect_to: ("/insert_ticket")
end
