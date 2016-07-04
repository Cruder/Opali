module Opali
  module HTTP
    module Codes
      LIST = {
        # Success
        ok:                     200,
        created:                201,
        accepted:               202,
        no_content:             204,
        # Errors Client side
        bad_request:            400,
        unauthorized:           401,
        forbiden:               401,
        not_found:              404,
        i_m_a_teapot:           418,
        unprocessable_entity:   422,
        # Errors Server side
        internal_server_errors: 500,
        not_implemented:        501,
        bad_gateway:            502,
        proxy_error:            502,
        service_unavailable:    503,
        gateway_time_out:       504
      }
    end
  end
end
