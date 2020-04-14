--
-- (C) 2019-20 - ntop.org
--

local alert_keys = require "alert_keys"
local alert_keys = require("alert_keys")

local function formatSynFlood(ifid, alert, threshold_info)
  local entity = alert_consts.formatAlertEntity(ifid, alert_consts.alertEntityRaw(alert["alert_entity"]), alert["alert_entity_val"])

  if(alert.alert_subtype == "syn_flood_attacker") then
    return i18n("alert_messages.syn_flood_attacker", {
      entity = firstToUpper(entity),
      value = string.format("%u", math.ceil(threshold_info.value)),
      threshold = threshold_info.threshold,
    })
  else
    return i18n("alert_messages.syn_flood_victim", {
      entity = firstToUpper(entity),
      value = string.format("%u", math.ceil(threshold_info.value)),
      threshold = threshold_info.threshold,
    })
  end
end

-- ##############################################

return {
  alert_key = alert_keys.ntopng.alert_tcp_syn_flood,
  i18n_title = "alerts_dashboard.tcp_syn_flood",
  i18n_description = formatSynFlood,
  icon = "fas fa-life-ring",
}
