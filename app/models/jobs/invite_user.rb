#   Copyright (c) 2010, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.


module Job
  class InviteUser < Base
    @queue = :mail
    def self.perform_delegate(sender_id, email, aspect_id, invite_message)
      user = User.find(sender_id)
      user.invite_user(email, aspect_id, invite_message)
    end
  end
end
