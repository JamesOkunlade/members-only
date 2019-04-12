module PostsHelper
    def get_user_name_by_id(id)
        User.find_by(id: id).name
    end
end
