class Payment < ApplicationRecord
enum :status {
    'pending': 0,
    'competed': 1
}

enum :provider {
    'razorpay': 0,
    'paytm': 1
}
end 