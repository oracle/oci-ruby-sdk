# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  # rubocop:disable Style/MutableConstant

  # Module defining available regions
  module Regions
    REGION_ENUM = [
      REGION_AP_CHUNCHEON_1 = 'ap-chuncheon-1'.freeze,
      REGION_AP_HYDERABAD_1 = 'ap-hyderabad-1'.freeze,
      REGION_AP_MELBOURNE_1 = 'ap-melbourne-1'.freeze,
      REGION_AP_MUMBAI_1 = 'ap-mumbai-1'.freeze,
      REGION_AP_OSAKA_1 = 'ap-osaka-1'.freeze,
      REGION_AP_SEOUL_1 = 'ap-seoul-1'.freeze,
      REGION_AP_SYDNEY_1 = 'ap-sydney-1'.freeze,
      REGION_AP_TOKYO_1 = 'ap-tokyo-1'.freeze,
      REGION_CA_MONTREAL_1 = 'ca-montreal-1'.freeze,
      REGION_CA_TORONTO_1 = 'ca-toronto-1'.freeze,
      REGION_EU_AMSTERDAM_1 = 'eu-amsterdam-1'.freeze,
      REGION_EU_FRANKFURT_1 = 'eu-frankfurt-1'.freeze,
      REGION_EU_ZURICH_1 = 'eu-zurich-1'.freeze,
      REGION_ME_JEDDAH_1 = 'me-jeddah-1'.freeze,
      REGION_ME_DUBAI_1 = 'me-dubai-1'.freeze,
      REGION_SA_SAOPAULO_1 = 'sa-saopaulo-1'.freeze,
      REGION_UK_CARDIFF_1 = 'uk-cardiff-1'.freeze,
      REGION_UK_LONDON_1 = 'uk-london-1'.freeze,
      REGION_US_ASHBURN_1 = 'us-ashburn-1'.freeze,
      REGION_US_PHOENIX_1 = 'us-phoenix-1'.freeze,
      REGION_US_SANJOSE_1 = 'us-sanjose-1'.freeze,
      REGION_SA_VINHEDO_1 = 'sa-vinhedo-1'.freeze,
      REGION_SA_SANTIAGO_1 = 'sa-santiago-1'.freeze,
      REGION_IL_JERUSALEM_1 = 'il-jerusalem-1'.freeze,
      REGION_EU_MARSEILLE_1 = 'eu-marseille-1'.freeze,
      REGION_AP_SINGAPORE_1 = 'ap-singapore-1'.freeze,
      REGION_ME_ABUDHABI_1 = 'me-abudhabi-1'.freeze,
      REGION_EU_MILAN_1 = 'eu-milan-1'.freeze,
      REGION_EU_STOCKHOLM_1 = 'eu-stockholm-1'.freeze,
      REGION_AF_JOHANNESBURG_1 = 'af-johannesburg-1'.freeze,
      REGION_EU_PARIS_1 = 'eu-paris-1'.freeze,
      REGION_US_LANGLEY_1 = 'us-langley-1'.freeze,
      REGION_US_LUKE_1 = 'us-luke-1'.freeze,
      REGION_US_GOV_ASHBURN_1 = 'us-gov-ashburn-1'.freeze,
      REGION_US_GOV_CHICAGO_1 = 'us-gov-chicago-1'.freeze,
      REGION_US_GOV_PHOENIX_1 = 'us-gov-phoenix-1'.freeze,
      REGION_UK_GOV_LONDON_1 = 'uk-gov-london-1'.freeze,
      REGION_UK_GOV_CARDIFF_1 = 'uk-gov-cardiff-1'.freeze,
      REGION_AP_CHIYODA_1 = 'ap-chiyoda-1'.freeze,
      REGION_AP_IBARAKI_1 = 'ap-ibaraki-1'.freeze,
      REGION_ME_DCC_MUSCAT_1 = 'me-dcc-muscat-1'.freeze,
      REGION_AP_DCC_CANBERRA_1 = 'ap-dcc-canberra-1'.freeze
    ]

    REGION_SHORT_NAMES_TO_LONG_NAMES = {
      'yny': REGION_AP_CHUNCHEON_1,
      'hyd': REGION_AP_HYDERABAD_1,
      'mel': REGION_AP_MELBOURNE_1,
      'bom': REGION_AP_MUMBAI_1,
      'kix': REGION_AP_OSAKA_1,
      'icn': REGION_AP_SEOUL_1,
      'syd': REGION_AP_SYDNEY_1,
      'nrt': REGION_AP_TOKYO_1,
      'yul': REGION_CA_MONTREAL_1,
      'yyz': REGION_CA_TORONTO_1,
      'ams': REGION_EU_AMSTERDAM_1,
      'fra': REGION_EU_FRANKFURT_1,
      'zrh': REGION_EU_ZURICH_1,
      'jed': REGION_ME_JEDDAH_1,
      'dxb': REGION_ME_DUBAI_1,
      'gru': REGION_SA_SAOPAULO_1,
      'cwl': REGION_UK_CARDIFF_1,
      'lhr': REGION_UK_LONDON_1,
      'iad': REGION_US_ASHBURN_1,
      'phx': REGION_US_PHOENIX_1,
      'sjc': REGION_US_SANJOSE_1,
      'vcp': REGION_SA_VINHEDO_1,
      'scl': REGION_SA_SANTIAGO_1,
      'mtz': REGION_IL_JERUSALEM_1,
      'mrs': REGION_EU_MARSEILLE_1,
      'sin': REGION_AP_SINGAPORE_1,
      'auh': REGION_ME_ABUDHABI_1,
      'lin': REGION_EU_MILAN_1,
      'arn': REGION_EU_STOCKHOLM_1,
      'jnb': REGION_AF_JOHANNESBURG_1,
      'cdg': REGION_EU_PARIS_1,
      'lfi': REGION_US_LANGLEY_1,
      'luf': REGION_US_LUKE_1,
      'ric': REGION_US_GOV_ASHBURN_1,
      'pia': REGION_US_GOV_CHICAGO_1,
      'tus': REGION_US_GOV_PHOENIX_1,
      'ltn': REGION_UK_GOV_LONDON_1,
      'brs': REGION_UK_GOV_CARDIFF_1,
      'nja': REGION_AP_CHIYODA_1,
      'ukb': REGION_AP_IBARAKI_1,
      'mct': REGION_ME_DCC_MUSCAT_1,
      'wga': REGION_AP_DCC_CANBERRA_1
    }

    # --- Start of region realm mapping ---
    REGION_REALM_MAPPING = {
      'ap-chuncheon-1': 'oc1'.freeze,
      'ap-hyderabad-1': 'oc1'.freeze,
      'ap-melbourne-1': 'oc1'.freeze,
      'ap-mumbai-1': 'oc1'.freeze,
      'ap-osaka-1': 'oc1'.freeze,
      'ap-seoul-1': 'oc1'.freeze,
      'ap-sydney-1': 'oc1'.freeze,
      'ap-tokyo-1': 'oc1'.freeze,
      'ca-montreal-1': 'oc1'.freeze,
      'ca-toronto-1': 'oc1'.freeze,
      'eu-amsterdam-1': 'oc1'.freeze,
      'eu-frankfurt-1': 'oc1'.freeze,
      'eu-zurich-1': 'oc1'.freeze,
      'me-jeddah-1': 'oc1'.freeze,
      'me-dubai-1': 'oc1'.freeze,
      'sa-saopaulo-1': 'oc1'.freeze,
      'uk-cardiff-1': 'oc1'.freeze,
      'uk-london-1': 'oc1'.freeze,
      'us-ashburn-1': 'oc1'.freeze,
      'us-phoenix-1': 'oc1'.freeze,
      'us-sanjose-1': 'oc1'.freeze,
      'sa-vinhedo-1': 'oc1'.freeze,
      'sa-santiago-1': 'oc1'.freeze,
      'il-jerusalem-1': 'oc1'.freeze,
      'eu-marseille-1': 'oc1'.freeze,
      'ap-singapore-1': 'oc1'.freeze,
      'me-abudhabi-1': 'oc1'.freeze,
      'eu-milan-1': 'oc1'.freeze,
      'eu-stockholm-1': 'oc1'.freeze,
      'af-johannesburg-1': 'oc1'.freeze,
      'eu-paris-1': 'oc1'.freeze,

      'us-langley-1': 'oc2'.freeze,
      'us-luke-1': 'oc2'.freeze,

      'us-gov-ashburn-1': 'oc3'.freeze,
      'us-gov-chicago-1': 'oc3'.freeze,
      'us-gov-phoenix-1': 'oc3'.freeze,

      'uk-gov-london-1': 'oc4'.freeze,
      'uk-gov-cardiff-1': 'oc4'.freeze,

      'ap-chiyoda-1': 'oc8'.freeze,
      'ap-ibaraki-1': 'oc8'.freeze,

      'me-dcc-muscat-1': 'oc9'.freeze,

      'ap-dcc-canberra-1': 'oc10'.freeze
    }
    # ---  end of region realm mapping  ---

    # --- Start of realm domain mapping ---
    REALM_DOMAIN_MAPPING = {
      'oc1': 'oraclecloud.com'.freeze,
      'oc2': 'oraclegovcloud.com'.freeze,
      'oc3': 'oraclegovcloud.com'.freeze,
      'oc4': 'oraclegovcloud.uk'.freeze,
      'oc8': 'oraclecloud8.com'.freeze,
      'oc9': 'oraclecloud9.com'.freeze,
      'oc10': 'oraclecloud10.com'.freeze
    }
    # ---  end of realm domain mapping  ---
  end
  # rubocop:enable Style/MutableConstant
end