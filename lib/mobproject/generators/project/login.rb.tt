#------------------------------------------------------------------
# FOLLOW THE BELLOW EXAMPLE TO CREATE YOUR PAGE OBJECT CLASSES
#------------------------------------------------------------------

class Login < MobTest::Base

  ios do
    text_field(:username, name: 'username')
    text_field(:password, name: 'password')
    button(:login, name: 'login')
  end

  android do
    text_field(:username, id: 'android:id/username')
    text_field(:password, id: 'android:id/password')
    button(:login, id: 'android:id/login')
  end

  web do
    text_field(:username, id: 'username')
    text_field(:password, name: 'password')
    button(:login, name: 'login')
  end

  ios do
    #place your ios specific methods within this block
  end

  android do
    #place your android specific methods within this block
  end

  web do
    #place your web specific methods within this block
  end

  #place methods that apply to all platforms outside the blocks
end
