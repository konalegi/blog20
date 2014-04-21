YaAcl::Builder.build do
  roles do
    role :admin
    role :user
    role :anonymous
  end

  asserts do
    assert :own_post?, [:current_user_id, :post_user_id] do
      current_user_id == post_user_id
    end
    assert :own_comment?, [:current_user_id, :comment_user_id] do
      current_user_id == comment_user_id
    end
  end

  resources :admin do
    resource 'posts',[:user] do
      privilege :index, [:user, :anonymous]
      privilege :create, [:user]
      privilege :update do
        assert :own_post?, [:user]
      end

      privilege :destroy do
        assert :own_post?, [:user]
      end

    end

    resource 'comments',[:user]  do
      privilege :index, [:user, :anonymous]
      privilege :create, [:user, :anonymous]
      privilege :update do
        assert :own_comment?, [:user]
      end
      privilege :destroy do
        assert :own_comment?, [:user]
      end
    end



  end


end