class Event < ApplicationRecord
  belongs_to :city
  belongs_to :user

  enum type: [:holes, :reclamation , :trash , :dissaster , :assaults ]
  enum status: [:pendent , :working , :solved ]

end
