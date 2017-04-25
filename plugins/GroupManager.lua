--Begin GroupManager.lua Byًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»
local function modadd(msg)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
    -- superuser and admins only (because sudo are always has privilege)
    if not is_admin(msg) then
   if not lang then
        return 'â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·'
else
     return '#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·'
    end
end
    local data = load_data(_config.moderation.data)
  if data[tostring(msg.to.id)] then
if not lang then
   return 'â™¯م€‹*Gرڈدƒد…دپ خ¹ر• خ±â„“رڈر”خ±âˆ‚رƒ خ±âˆ‚âˆ‚ر”âˆ‚*âœ…â™»ï¸ڈ'
else
return '#م€‹_ع¯ط±ظˆظ‡ ط¯ط± ظ„غŒط³طھ ع¯ط±ظˆظ‡ ظ¾ط´طھغŒط¨ط§ظ† ط±ط¨ط§طھ ظ‚ط¨ظ„ط§ ط¨ظˆط¯ظ‡ ط§ط³طھâœ…â™»ï¸ڈ_'
  end
end
        -- create data array in moderation.json
      data[tostring(msg.to.id)] = {
              owners = {},
      mods ={},
      banned ={},
      is_silent_users ={},
      filterlist ={},
      settings = {
          set_name = msg.to.title,
          lock_link = 'yes',
          lock_tag = 'yes',
          lock_spam = 'yes',
          lock_webpage = 'yes',
          lock_markdown = 'no',
		  lock_mention = 'no',
		  lock_arabic = 'no',
		  lock_edit = 'no',
          flood = 'yes',
          lock_bots = 'yes',
          lock_pin = 'no',
		  lock_tabchi = 'no',
          welcome = 'no',
				   english = 'no',
				   views = 'no',
				   emoji ='no',
				   ads = 'no',
				   fosh = 'no'
				   
          },
		  mute = {
		    mute_fwd = 'yes',
                  mute_audio = 'no',
                  mute_video = 'no',
                  mute_contact = 'yes',
                  mute_text = 'no',
                  mute_photos = 'no',
                  mute_gif = 'no',
                  mute_loc = 'no',
                  mute_doc = 'no',
                  mute_sticker = 'no',
                  mute_voice = 'no',
                   mute_all = 'no',
				   mute_keyboard = 'yes'
		  }
      }
 save_data(_config.moderation.data, data)
      local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = {}
        save_data(_config.moderation.data, data)
      end
      data[tostring(groups)][tostring(msg.to.id)] = msg.to.id
      save_data(_config.moderation.data, data)
    if not lang then
  return '#م€‹*Group has been addedâœ…*'
else
  return '#م€‹ع¯ط±ظˆظ‡ ط¨ظ‡ ظ„غŒط³طھ ع¯ط±ظˆظ‡ ظ‡ط§غŒ ظ¾ط´طھغŒط¨ط§ظ†غŒ ط§ط¶ط§ظپظ‡ ط´ط¯âœ…'
end
end

local function modrem(msg)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
    -- superuser and admins only (because sudo are always has privilege)
      if not is_admin(msg) then
     if not lang then
        return '#م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·'
   else
        return '#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·'
    end
   end
    local data = load_data(_config.moderation.data)
    local receiver = msg.to.id
  if not data[tostring(msg.to.id)] then
  if not lang then
    return '#م€‹*Gرڈدƒد…دپ خ¹ر• خ·دƒر‚ خ±âˆ‚âˆ‚ر”âˆ‚â‌Œâ‌—ï¸ڈ*'
else
    return '_#م€‹ع¯ط±ظˆظ‡ ط¯ط± ظ„غŒط³طھ ع¯ط±ظˆظ‡ ظ‡ط§غŒ ظ¾ط´طھغŒط¨ط§ظ†غŒ ظ†غŒط³طھâ‌Œâ‌—ï¸ڈ_'
   end
  end

  data[tostring(msg.to.id)] = nil
  save_data(_config.moderation.data, data)
     local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = nil
        save_data(_config.moderation.data, data)
      end data[tostring(groups)][tostring(msg.to.id)] = nil
      save_data(_config.moderation.data, data)
 if not lang then
  return '*#م€‹Gرڈدƒد…دپ ذ½خ±ر• ذ²ر”ر”خ· رڈر”ذ¼دƒخ½ر”âˆ‚âœ…*'
 else
  return '_#م€‹ع¯ط±ظˆظ‡ ط§ط² ظ„غŒط³طھ ع¯ط±ظˆظ‡ ظ‡ط§غŒ ظ¾ط´طھغŒط¨ط§ظ†غŒ ط­ط°ظپ ط´ط¯âœ…_'
end
end

local function filter_word(msg, word)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local data = load_data(_config.moderation.data)
  if not data[tostring(msg.to.id)]['filterlist'] then
    data[tostring(msg.to.id)]['filterlist'] = {}
    save_data(_config.moderation.data, data)
    end
if data[tostring(msg.to.id)]['filterlist'][(word)] then
   if not lang then
         return "#م€‹_Wدƒرڈâˆ‚_ *"..word.."* _خ¹ر• خ±â„“رڈر”خ±âˆ‚رƒ ئ’خ¹â„“ر‚ر”رڈر”âˆ‚_â™»ï¸ڈ"
            else
         return "#م€‹_ع©ظ„ظ…ظ‡_ *"..word.."* _ط§ط² ظ‚ط¨ظ„ ظپغŒظ„طھط± ط¨ظˆط¯_â™»ï¸ڈ"
    end
end
   data[tostring(msg.to.id)]['filterlist'][(word)] = true
     save_data(_config.moderation.data, data)
   if not lang then
         return "#م€‹_Wدƒرڈâˆ‚_ *"..word.."* _خ±âˆ‚âˆ‚ر”âˆ‚ ر‚دƒ ئ’خ¹â„“ر‚ر”رڈر”âˆ‚ د‰دƒرڈâˆ‚ر• â„“خ¹ر•ر‚_âœ…"
            else
         return "#م€‹_ع©ظ„ظ…ظ‡_ *"..word.."* _ط¨ظ‡ ظ„غŒط³طھ ع©ظ„ظ…ط§طھ ظپغŒظ„طھط± ط§ط¶ط§ظپظ‡ ط´ط¯_âœ…"
    end
end

local function unfilter_word(msg, word)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 local data = load_data(_config.moderation.data)
  if not data[tostring(msg.to.id)]['filterlist'] then
    data[tostring(msg.to.id)]['filterlist'] = {}
    save_data(_config.moderation.data, data)
    end
      if data[tostring(msg.to.id)]['filterlist'][word] then
      data[tostring(msg.to.id)]['filterlist'][(word)] = nil
       save_data(_config.moderation.data, data)
       if not lang then
         return "#م€‹_Wدƒرڈâˆ‚_ *"..word.."* _رڈر”ذ¼دƒخ½ر”âˆ‚ ئ’رڈدƒذ¼ ئ’خ¹â„“ر‚ر”رڈر”âˆ‚ د‰دƒرڈâˆ‚ر• â„“خ¹ر•ر‚_â‌Œ"
       elseif lang then
         return "#م€‹_ع©ظ„ظ…ظ‡_ *"..word.."* _ط§ط² ظ„غŒط³طھ ع©ظ„ظ…ط§طھ ظپغŒظ„طھط± ط­ط°ظپ ط´ط¯_â‌Œ"
     end
      else
       if not lang then
         return "#م€‹_Wدƒرڈâˆ‚_ *"..word.."* _خ¹ر• خ·دƒر‚ ئ’خ¹â„“ر‚ر”رڈر”âˆ‚_â‌•"
       elseif lang then
         return "#م€‹_ع©ظ„ظ…ظ‡_ *"..word.."* _ط§ط² ظ‚ط¨ظ„ ظپغŒظ„طھط± ظ†ط¨ظˆط¯_â‌•"
      end
   end
end

local function modlist(msg)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
    local data = load_data(_config.moderation.data)
    local i = 1
  if not data[tostring(msg.chat_id_)] then
  if not lang then
    return "#م€‹*Gرڈدƒد…دپ خ¹ر• خ·دƒر‚ خ±âˆ‚âˆ‚ر”âˆ‚â‌Œâ‌—ï¸ڈ*"
 else
    return "_#م€‹ع¯ط±ظˆظ‡ ط¯ط± ظ„غŒط³طھ ع¯ط±ظˆظ‡ ظ‡ط§غŒ ظ¾ط´طھغŒط¨ط§ظ†غŒ ظ†غŒط³طھâ‌Œâ‌—ï¸ڈ_"
  end
 end
  -- determine if table is empty
  if next(data[tostring(msg.to.id)]['mods']) == nil then --fix way
  if not lang then
    return "#م€‹_Nدƒ_ *ذ¼دƒâˆ‚ر”رڈخ±ر‚دƒرڈ* _خ¹خ· ر‚ذ½خ¹ر• gرڈدƒد…دپ_â‌—ï¸ڈâ‌•"
else
   return "#م€‹_ط¯ط± ط§غŒظ† ع¯ط±ظˆظ‡ ظ‡غŒع† ظ…ط¹ط§ظˆظ†غŒ ط¨ط±ط§غŒ ط±ط¨ط§طھ ط§ظ†طھط®ط§ط¨ ظ†ط´ط¯ظ‡ ط§ط³طھâ‌—ï¸ڈًں‘¤_"
  end
end
if not lang then
   message = 'âک†م€‹ًں“‹*Lخ¹ر•ر‚ دƒئ’ ذ¼دƒâˆ‚ر”رڈخ±ر‚دƒرڈر• :*\n'
else
   message = 'âک†م€‹ًں“‹ظ„غŒط³طھ ظ…ط¹ط§ظˆظ† ظ‡ط§غŒ ع¯ط±ظˆظ‡ \n'
end
  for k,v in pairs(data[tostring(msg.to.id)]['mods'])
do
    message = message ..i.. '- '..v..' [' ..k.. '] \n'
   i = i + 1
end
  return message
end

local function ownerlist(msg)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
    local data = load_data(_config.moderation.data)
    local i = 1
  if not data[tostring(msg.to.id)] then
if not lang then
    return "#م€‹*Gرڈدƒد…دپ خ¹ر• خ·دƒر‚ خ±âˆ‚âˆ‚ر”âˆ‚â‌Œâ‌—ï¸ڈ*"
else
return "#م€‹_ط¯ط± ط§غŒظ† ع¯ط±ظˆظ‡ ظ‡غŒع† ظ…ط¹ط§ظˆظ†غŒ ط¨ط±ط§غŒ ط±ط¨ط§طھ ط§ظ†طھط®ط§ط¨ ظ†ط´ط¯ظ‡ ط§ط³طھâ‌—ï¸ڈًں‘¤_"
  end
end
  -- determine if table is empty
  if next(data[tostring(msg.to.id)]['owners']) == nil then --fix way
 if not lang then
    return "#م€‹_Nدƒ_ *دƒد‰خ·ر”رڈ* _خ¹خ· ر‚ذ½خ¹ر• gرڈدƒد…دپ_â‌•ًں‘¤"
else
    return "#م€‹ظ‡غŒع† ظ…ط¯غŒط±غŒ ط¨ط±ط§غŒ ط±ط¨ط§طھ ط¯ط± ط§غŒظ† ع¯ط±ظˆظ‡ ط§ظ†طھط®ط§ط¨ ظ†ط´ط¯ظ‡ ط§ط³طھâ‌•ًں‘¤"
  end
end
if not lang then
   message = 'âک†م€‹ًں“‹*Lخ¹ر•ر‚ دƒئ’ ذ¼دƒâˆ‚ر”رڈخ±ر‚دƒرڈر• :*\n'
else
   message = 'âک†م€‹ًں“‹*ظ„غŒط³طھ ظ…ط¯غŒط±ط§ظ† ع¯ط±ظˆظ‡ :*\n'
end
  for k,v in pairs(data[tostring(msg.to.id)]['owners']) do
    message = message ..i.. '- '..v..' [' ..k.. '] \n'
   i = i + 1
end
  return message
end

local function action_by_reply(arg, data)
local hash = "gp_lang:"..data.chat_id_
local lang = redis:get(hash)
local cmd = arg.cmd
    local administration = load_data(_config.moderation.data)
if not tonumber(data.sender_user_id_) then return false end
    if data.sender_user_id_ then
  if not administration[tostring(data.chat_id_)] then
  if not lang then
    return tdcli.sendMessage(data.chat_id_, "", 0, "#م€‹*Gرڈدƒد…دپ خ¹ر• خ·دƒر‚ خ±âˆ‚âˆ‚ر”âˆ‚â‌Œâ‌—ï¸ڈ*", 0, "md")
else
    return tdcli.sendMessage(data.chat_id_, "", 0, "_#م€‹ع¯ط±ظˆظ‡ ط¯ط±ظ„غŒط³طھ ع¯ط±ظˆظ‡ ظ‡ط§غŒ ظ¾ط´طھغŒط¨ط§ظ†غŒ ظ†غŒط³طھâ‌Œâ‌—ï¸ڈ_", 0, "md")
     end
  end
if cmd == "setowner" then
local function owner_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤_Uر•ر”رڈ_ "..user_name.." *"..data.id_.."* _خ¹ر• خ±â„“رڈر”خ±âˆ‚رƒ خ±_ *gرڈدƒد…دپ دƒد‰خ·ر”رڈ*â™»ï¸ڈ", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤ع©ط§ط±ط¨ط±"..user_name.." *"..data.id_.."* *ط§ط² ظ‚ط¨ظ„ ظ…ط¯غŒط± ط¨ظˆط¯*â™»ï¸ڈ", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤_Uر•ر”رڈ_ "..user_name.." *"..data.id_.."* _خ¹ر• خ·دƒد‰ ر‚ذ½ر”_ *gرڈدƒد…دپ دƒد‰خ·ر”رڈ*âœ…", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤ع©ط§ط±ط¨ط± "..user_name.." *"..data.id_.."* *ظ…ط¯غŒط± ع¯ط±ظˆظ‡ ط´ط¯*âœ…", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, owner_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "promote" then
local function promote_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤_Uر•ر”رڈ_ "..user_name.." *"..data.id_.."* _خ¹ر• خ±â„“رڈر”خ±âˆ‚رƒ خ±_ *ذ¼دƒâˆ‚ر”رڈخ±ر‚دƒرڈ*â™»ï¸ڈ", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤ع©ط§ط±ط¨ط± "..user_name.." *"..data.id_.."* *ط§ط² ظ‚ط¨ظ„ ظ…ط¹ط§ظˆظ† ع¯ط±ظˆظ‡ ط¨ظˆط¯*â™»ï¸ڈ", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤_Uر•ر”رڈ_ "..user_name.." *"..data.id_.."* _ذ½خ±ر• ذ²ر”ر”خ·_ *دپرڈدƒذ¼دƒر‚ر”âˆ‚*âœ…", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤ع©ط§ط±ط¨ط± "..user_name.." *"..data.id_.."* *ظ…ط¹ط§ظˆظ† ع¯ط±ظˆظ‡ ط´ط¯*âœ…", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, promote_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
     if cmd == "remowner" then
local function rem_owner_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if not administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤_Uر•ر”رڈ_ "..user_name.." *"..data.id_.."* _خ¹ر• خ·دƒر‚ خ±_ *gرڈدƒد…دپ دƒد‰خ·ر”رڈ*â‌Œ", 0, "md")
   else
return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤ع©ط§ط±ط¨ط± "..user_name.." *"..data.id_.."* *ط§ط² ظ‚ط¨ظ„ ظ…ط¯غŒط± ظ†ط¨ظˆط¯*â‌Œ", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤_Uر•ر”رڈ_ "..user_name.." *"..data.id_.."* _خ¹ر• âˆ‚ر”ذ¼دƒر‚ر” دƒئ’_ *gرڈدƒد…دپ دƒد‰خ·ر”رڈ*âœ…", 0, "md")
    else
return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤ع©ط§ط±ط¨ط± "..user_name.." *"..data.id_.."* *ط§ط² ظ…ظ‚ط§ظ… ظ…ط¯غŒط± ط¨ط±ع©ظ†ط§ط± ط´ط¯*âœ…", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, rem_owner_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "demote" then
local function demote_cb(arg, data)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if not administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤_Uر•ر”رڈ_ "..user_name.." *"..data.id_.."* _خ¹ر• خ·دƒر‚ خ±_ *ذ¼دƒâˆ‚ر”رڈخ±ر‚دƒرڈ*â‌—ï¸ڈ", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤ع©ط§ط±ط¨ط± "..user_name.." *"..data.id_.."* *ط§ط² ظ‚ط¨ظ„ ظ…ط¹ط§ظˆظ† ظ†ط¨ظˆط¯*â‌—ï¸ڈ", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤_Uر•ر”رڈ_ "..user_name.." *"..data.id_.."* _ذ½خ±ر• ذ²ر”ر”خ·_ *âˆ‚ر”ذ¼دƒر‚ر”âˆ‚*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤ع©ط§ط±ط¨ط± "..user_name.." *"..data.id_.."* *ط§ط² ظ…ظ‚ط§ظ… ظ…ط¹ط§ظˆظ† ع¯ط±ظˆظ‡ ط¨ط±ع©ظ†ط§ط± ط´ط¯*âœ…", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, demote_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "id" then
local function id_cb(arg, data)
    return tdcli.sendMessage(arg.chat_id, "", 0, "*"..data.id_.."*", 0, "md")
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, id_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
else
    if lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, "", 0, "md")
   else
  return tdcli.sendMessage(data.chat_id_, "", 0, "", 0, "md")
      end
   end
end

local function action_by_username(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
local cmd = arg.cmd
    local administration = load_data(_config.moderation.data)
  if not administration[tostring(arg.chat_id)] then
  if not lang then
    return tdcli.sendMessage(data.chat_id_, "", 0, "â™¯م€‹*Gرڈدƒد…دپ خ¹ر• خ·دƒر‚ خ±âˆ‚âˆ‚ر”âˆ‚â‌Œâ‌—ï¸ڈ*", 0, "md")
else
    return tdcli.sendMessage(data.chat_id_, "", 0, "_#م€‹ع¯ط±ظˆظ‡ ط¯ط±ظ„غŒط³طھ ع¯ط±ظˆظ‡ ظ‡ط§غŒ ظ¾ط´طھغŒط¨ط§ظ†غŒ ظ†غŒط³طھâ‌Œâ‌—ï¸ڈ_", 0, "md")
     end
  end
if not arg.username then return false end
   if data.id_ then
if data.type_.user_.username_ then
user_name = '@'..check_markdown(data.type_.user_.username_)
else
user_name = check_markdown(data.title_)
end
if cmd == "setowner" then
if administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤_Uر•ر”رڈ_ "..user_name.." *"..data.id_.."* _خ¹ر• خ±â„“رڈر”خ±âˆ‚رƒ خ±_ *gرڈدƒد…دپ دƒد‰خ·ر”رڈ*â™»ï¸ڈ", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤ع©ط§ط±ط¨ط±"..user_name.." *"..data.id_.."* *ط§ط² ظ‚ط¨ظ„ ظ…ط¯غŒط± ط¨ظˆط¯*â™»ï¸ڈ", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤_Uر•ر”رڈ_ "..user_name.." *"..data.id_.."* _خ¹ر• خ·دƒد‰ ر‚ذ½ر”_ *gرڈدƒد…دپ دƒد‰خ·ر”رڈ*âœ…", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤ع©ط§ط±ط¨ط± "..user_name.." *"..data.id_.."* *ظ…ط¯غŒط± ع¯ط±ظˆظ‡ ط´ط¯*âœ…", 0, "md")   end
end
  if cmd == "promote" then
if administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤_Uر•ر”رڈ_ "..user_name.." *"..data.id_.."* _خ¹ر• خ±â„“رڈر”خ±âˆ‚رƒ خ±_ *ذ¼دƒâˆ‚ر”رڈخ±ر‚دƒرڈ*â™»ï¸ڈ", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤ع©ط§ط±ط¨ط± "..user_name.." *"..data.id_.."* *ط§ط² ظ‚ط¨ظ„ ظ…ط¹ط§ظˆظ† ع¯ط±ظˆظ‡ ط¨ظˆط¯*â™»ï¸ڈ", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤_Uر•ر”رڈ_ "..user_name.." *"..data.id_.."* _ذ½خ±ر• ذ²ر”ر”خ·_ *دپرڈدƒذ¼دƒر‚ر”âˆ‚*âœ…", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤ع©ط§ط±ط¨ط± "..user_name.." *"..data.id_.."* *ظ…ط¹ط§ظˆظ† ع¯ط±ظˆظ‡ ط´ط¯*âœ…", 0, "md")
   end
end
   if cmd == "remowner" then
if not administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤_Uر•ر”رڈ_ "..user_name.." *"..data.id_.."* _خ¹ر• خ·دƒر‚ خ±_ *gرڈدƒد…دپ دƒد‰خ·ر”رڈ*â‌Œ", 0, "md")
   else
return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤ع©ط§ط±ط¨ط± "..user_name.." *"..data.id_.."* *ط§ط² ظ…ظ‚ط§ظ… ظ…ط¯غŒط± ط¨ط±ع©ظ†ط§ط± ط´ط¯*âœ…", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤_Uر•ر”رڈ_ "..user_name.." *"..data.id_.."* _خ¹ر• âˆ‚ر”ذ¼دƒر‚ر” دƒئ’_ *gرڈدƒد…دپ دƒد‰خ·ر”رڈ*âœ…", 0, "md")
    else
return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤ع©ط§ط±ط¨ط± "..user_name.." *"..data.id_.."* *ط§ط² ظ…ظ‚ط§ظ… ظ…ط¯غŒط± ط¨ط±ع©ظ†ط§ط± ط´ط¯*âœ…", 0, "md")
   end
end
   if cmd == "demote" then
if not administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤_Uر•ر”رڈ_ "..user_name.." *"..data.id_.."* _خ¹ر• خ·دƒر‚ خ±_ *ذ¼دƒâˆ‚ر”رڈخ±ر‚دƒرڈ*â‌—ï¸ڈ", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤ع©ط§ط±ط¨ط± "..user_name.." *"..data.id_.."* *ط§ط² ظ‚ط¨ظ„ ظ…ط¹ط§ظˆظ† ظ†ط¨ظˆط¯*â‌—ï¸ڈ", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤_Uر•ر”رڈ_ "..user_name.." *"..data.id_.."* _ذ½خ±ر• ذ²ر”ر”خ·_ *âˆ‚ر”ذ¼دƒر‚ر”âˆ‚*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤ع©ط§ط±ط¨ط± "..user_name.." *"..data.id_.."* *ط§ط² ظ…ظ‚ط§ظ… ظ…ط¹ط§ظˆظ† ع¯ط±ظˆظ‡ ط¨ط±ع©ظ†ط§ط± ط´ط¯*âœ…", 0, "md")
   end
end
   if cmd == "id" then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*"..data.id_.."*", 0, "md")
end
    if cmd == "res" then
    if not lang then
     text = "â™¯م€‹Rر”ر•د…â„“ر‚ ئ’دƒرڈًں“„ [ "..check_markdown(data.type_.user_.username_).." ] :\n"
    .. ""..check_markdown(data.title_).."\n"
    .. " ["..data.id_.."]"
  else
     text = "#م€‹ط§ط·ظ„ط§ط¹ط§طھ ط¨ط±ط§غŒًں“„ [ "..check_markdown(data.type_.user_.username_).." ] :\n"
    .. "".. check_markdown(data.title_) .."\n"
    .. " [".. data.id_ .."]"
         end
       return tdcli.sendMessage(arg.chat_id, 0, 1, text, 1, 'md')
   end
else
    if lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "", 0, "md")
      end
   end
end

local function action_by_id(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
local cmd = arg.cmd
    local administration = load_data(_config.moderation.data)
  if not administration[tostring(arg.chat_id)] then
  if not lang then
    return tdcli.sendMessage(data.chat_id_, "", 0, "â™¯م€‹*Gرڈدƒد…دپ خ¹ر• خ·دƒر‚ خ±âˆ‚âˆ‚ر”âˆ‚â‌Œâ‌—ï¸ڈ*", 0, "md")
else
    return tdcli.sendMessage(data.chat_id_, "", 0, "_#م€‹ع¯ط±ظˆظ‡ ط¯ط±ظ„غŒط³طھ ع¯ط±ظˆظ‡ ظ‡ط§غŒ ظ¾ط´طھغŒط¨ط§ظ†غŒ ظ†غŒط³طھâ‌Œâ‌—ï¸ڈ_", 0, "md")
     end
  end
if not tonumber(arg.user_id) then return false end
   if data.id_ then
if data.first_name_ then
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
  if cmd == "setowner" then
  if administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤_Uر•ر”رڈ_ "..user_name.." *"..data.id_.."* _خ¹ر• خ±â„“رڈر”خ±âˆ‚رƒ خ±_ *gرڈدƒد…دپ دƒد‰خ·ر”رڈ*â™»ï¸ڈ", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤ع©ط§ط±ط¨ط±"..user_name.." *"..data.id_.."* *ط§ط² ظ‚ط¨ظ„ ظ…ط¯غŒط± ط¨ظˆط¯*â™»ï¸ڈ", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤_Uر•ر”رڈ_ "..user_name.." *"..data.id_.."* _خ¹ر• خ·دƒد‰ ر‚ذ½ر”_ *gرڈدƒد…دپ دƒد‰خ·ر”رڈ*âœ…", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤ع©ط§ط±ط¨ط± "..user_name.." *"..data.id_.."* *ظ…ط¯غŒط± ع¯ط±ظˆظ‡ ط´ط¯*âœ…", 0, "md")   end
   end
end
  if cmd == "promote" then
if administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤_Uر•ر”رڈ_ "..user_name.." *"..data.id_.."* _خ¹ر• خ±â„“رڈر”خ±âˆ‚رƒ خ±_ *ذ¼دƒâˆ‚ر”رڈخ±ر‚دƒرڈ*â™»ï¸ڈ", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤ع©ط§ط±ط¨ط± "..user_name.." *"..data.id_.."* *ط§ط² ظ‚ط¨ظ„ ظ…ط¹ط§ظˆظ† ع¯ط±ظˆظ‡ ط¨ظˆط¯*â™»ï¸ڈ", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤_Uر•ر”رڈ_ "..user_name.." *"..data.id_.."* _ذ½خ±ر• ذ²ر”ر”خ·_ *دپرڈدƒذ¼دƒر‚ر”âˆ‚*âœ…", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤ع©ط§ط±ط¨ط± "..user_name.." *"..data.id_.."* *ظ…ط¹ط§ظˆظ† ع¯ط±ظˆظ‡ ط´ط¯*âœ…", 0, "md")
   end
end
   if cmd == "remowner" then
if not administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤_Uر•ر”رڈ_ "..user_name.." *"..data.id_.."* _خ¹ر• خ·دƒر‚ خ±_ *gرڈدƒد…دپ دƒد‰خ·ر”رڈ*â‌Œ", 0, "md")
   else
return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤ع©ط§ط±ط¨ط± "..user_name.." *"..data.id_.."* *ط§ط² ظ…ظ‚ط§ظ… ظ…ط¯غŒط± ط¨ط±ع©ظ†ط§ط± ط´ط¯*âœ…", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤_Uر•ر”رڈ_ "..user_name.." *"..data.id_.."* _خ¹ر• âˆ‚ر”ذ¼دƒر‚ر” دƒئ’_ *gرڈدƒد…دپ دƒد‰خ·ر”رڈ*âœ…", 0, "md")
    else
return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤ع©ط§ط±ط¨ط± "..user_name.." *"..data.id_.."* *ط§ط² ظ…ظ‚ط§ظ… ظ…ط¯غŒط± ط¨ط±ع©ظ†ط§ط± ط´ط¯*âœ…", 0, "md")
   end
end
   if cmd == "demote" then
if not administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤_Uر•ر”رڈ_ "..user_name.." *"..data.id_.."* _خ¹ر• خ·دƒر‚ خ±_ *ذ¼دƒâˆ‚ر”رڈخ±ر‚دƒرڈ*â‌—ï¸ڈ", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤ع©ط§ط±ط¨ط± "..user_name.." *"..data.id_.."* *ط§ط² ظ‚ط¨ظ„ ظ…ط¹ط§ظˆظ† ظ†ط¨ظˆط¯*â‌—ï¸ڈ", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤_Uر•ر”رڈ_ "..user_name.." *"..data.id_.."* _ذ½خ±ر• ذ²ر”ر”خ·_ *âˆ‚ر”ذ¼دƒر‚ر”âˆ‚*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "âک†م€‹ًں‘¤ع©ط§ط±ط¨ط± "..user_name.." *"..data.id_.."* *ط§ط² ظ…ظ‚ط§ظ… ظ…ط¹ط§ظˆظ† ع¯ط±ظˆظ‡ ط¨ط±ع©ظ†ط§ط± ط´ط¯*âœ…", 0, "md")
   end
end
    if cmd == "whois" then
if data.username_ then
username = '@'..check_markdown(data.username_)
else
if not lang then
username = 'âک†م€‹خ·دƒر‚ ئ’دƒد…خ·âˆ‚â‌—ï¸ڈ'
 else
username = 'âک†م€‹ظ†ط¯ط§ط±ط¯â‌—ï¸ڈ'
  end
end
     if not lang then
       return tdcli.sendMessage(arg.chat_id, 0, 1, 'âک†م€‹Iخ·ئ’دƒ ئ’دƒرڈًں“ƒ [ '..data.id_..' ] :\nًں‘¤Uر•ر”رڈNخ±ذ¼ر” : '..username..'\nًں’ژNخ±ذ¼ر” : '..data.first_name_, 1)
   else
       return tdcli.sendMessage(arg.chat_id, 0, 1, 'âک†م€‹ط§ط·ظ„ط§ط¹ط§طھ ط¨ط±ط§غŒًں“ƒ  [ '..data.id_..' ] :\nًں‘¤غŒظˆط²ط±ظ†غŒظ… : '..username..'\nًں’ژظ†ط§ظ… : '..data.first_name_, 1)
      end
   end
 else
    if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "", 0, "md")
    end
  end
end


---------------Lock Link-------------------
local function lock_link(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
 return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end

local lock_link = data[tostring(target)]["settings"]["lock_link"] 
if lock_link == "yes" then
if not lang then
 return "âک†م€‹*Lخ¹خ·ذ؛* _Pدƒر•ر‚خ¹خ·g Iر• Aâ„“رڈر”خ±âˆ‚رƒ Lدƒcذ؛ر”âˆ‚_ًں”’\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
elseif lang then
 return "âک†م€‹ط§ط±ط³ط§ظ„ #ظ„غŒظ†ع© ط¯ط± ع¯ط±ظˆظ‡  ط§ط² ظ‚ط¨ظ„ط§ ظ…ظ…ظ†ظˆط¹ ط§ط³طھًں”’\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else
data[tostring(target)]["settings"]["lock_link"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "âک†م€‹*Lخ¹خ·ذ؛* _Pدƒر•ر‚خ¹خ·g Hخ±ر• Bر”ر”خ· Lدƒcذ؛ر”âˆ‚_ًں”’\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
else
 return "âک†م€‹ط§ط±ط³ط§ظ„ #ظ„غŒظ†ع© ط¯ط± ع¯ط±ظˆظ‡  ط§ط² ظ‚ط¨ظ„ط§ ظ…ظ…ظ†ظˆط¹ ط§ط³طھًں”’\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end

local function unlock_link(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end 

local lock_link = data[tostring(target)]["settings"]["lock_link"]
 if lock_link == "no" then
if not lang then
return "âک†م€‹*Lخ¹خ·ذ؛* _Pدƒر•ر‚خ¹خ·g Iر• Nدƒر‚ Lدƒcذ؛ر”âˆ‚_ًں”“\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
elseif lang then
return "âک†م€‹ط§ط±ط³ط§ظ„ #ظ„غŒظ†ع© ط¯ط± ع¯ط±ظˆظ‡  ط§ط² ظ‚ط¨ظ„ط§ ظ…ظ…ظ†ظˆط¹ ظ†غŒط³طھًں”“\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else 
data[tostring(target)]["settings"]["lock_link"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "âک†م€‹*Lخ¹خ·ذ؛* _Pدƒر•ر‚خ¹خ·g Hخ±ر• Bر”ر”خ· Uخ·â„“دƒcذ؛ر”âˆ‚_ًں”“\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
else
return "âک†م€‹ط§ط±ط³ط§ظ„ #ظ„غŒظ†ع© ط¯ط± ع¯ط±ظˆظ‡  ط§ط²ط§ط¯ ط´ط¯ًں”“\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end
---------------Lock Tag-------------------
local function lock_tag(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
 return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end

local lock_tag = data[tostring(target)]["settings"]["lock_tag"] 
if lock_tag == "yes" then
if not lang then
 return "âک†م€‹*Tخ±g* _Pدƒر•ر‚خ¹خ·g Iر• Aâ„“رڈر”خ±âˆ‚رƒ Lدƒcذ؛ر”âˆ‚_ًں”’\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
elseif lang then
 return "âک†م€‹ط§ط±ط³ط§ظ„ #ظ‡ط´طھع¯ ظˆ غŒظˆط²ط±ظ†غŒظ… ط¯ط± ع¯ط±ظˆظ‡  ط§ط² ظ‚ط¨ظ„ط§ ظ…ظ…ظ†ظˆط¹ ط§ط³طھًں”’\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else
 data[tostring(target)]["settings"]["lock_tag"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "âک†م€‹*Tخ±g* _Pدƒر•ر‚خ¹خ·g Hخ±ر• Bر”ر”خ· Lدƒcذ؛ر”âˆ‚_ًں”’\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
else
 return "âک†م€‹ط§ط±ط³ط§ظ„ #ظ‡ط´طھع¯ ظˆ غŒظˆط²ط±ظ†غŒظ… ط¯ط± ع¯ط±ظˆظ‡ ظ…ظ…ظ†ظˆط¹ ط´ط¯ًں”’\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end

local function unlock_tag(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
 return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end 
end

local lock_tag = data[tostring(target)]["settings"]["lock_tag"]
 if lock_tag == "no" then
if not lang then
return "âک†م€‹*Tخ±g* _Pدƒر•ر‚خ¹خ·g Iر• Nدƒر‚ Lدƒcذ؛ر”âˆ‚_ًں”“\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
elseif lang then
return "âک†م€‹ط§ط±ط³ط§ظ„ #ظ‡ط´طھع¯ ظˆ غŒظˆط²ط±ظ†غŒظ… ط¯ط± ع¯ط±ظˆظ‡  ط§ط² ظ‚ط¨ظ„ط§ ظ…ظ…ظ†ظˆط¹ ظ†غŒط³طھًں”“\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else 
data[tostring(target)]["settings"]["lock_tag"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "âک†م€‹*Tخ±g* _Pدƒر•ر‚خ¹خ·g Hخ±ر• Bر”ر”خ· Uخ·â„“دƒcذ؛ر”âˆ‚_ًں”“\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
else
return "âک†م€‹ط§ط±ط³ط§ظ„ #ظ‡ط´طھع¯ ظˆ غŒظˆط²ط±ظ†غŒظ… ط¯ط± ع¯ط±ظˆظ‡  ط§ط²ط§ط¯ ط´ط¯ًں”“\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end
---------------Lock Vewis-------------------
local function lock_views(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
 return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end

local lock_views = data[tostring(target)]["settings"]["views"] 
if lock_views == "yes" then
if not lang then
 return "#Views _Posting Is Already Locked_\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
elseif lang then
 return "ط§ط±ط³ط§ظ„ #ظ¾ط³طھ ظˆغŒظˆ ط¯ط§ط± ط¯ط± ع¯ط±ظˆظ‡ ظ‡ظ… ط§ع©ظ†ظˆظ† ظ…ظ…ظ†ظˆط¹ ط§ط³طھًں”’\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else
 data[tostring(target)]["settings"]["views"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "#Views _Posting Has Been Locked_\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
else
 return "ط§ط±ط³ط§ظ„ #ظ¾ط³طھ ظˆغŒظˆ ط¯ط§ط± ط¯ط± ع¯ط±ظˆظ‡ ظ…ظ…ظ†ظˆط¹ ط´ط¯ًں”’\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end

local function unlock_views(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
 return "ط´ظ…ط§ ظ…ط¯غŒط± ع¯ط±ظˆظ‡ ظ†ظ…غŒط¨ط§ط´غŒط¯"
end 
end

local lock_views = data[tostring(target)]["settings"]["views"]
 if lock_views == "no" then
if not lang then
return "#Views _Posting Is Not Locked_\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
elseif lang then
return "ط§ط±ط³ط§ظ„ #ظ¾ط³طھ ظˆغŒظˆ ط¯ط§ط± ط¯ط± ع¯ط±ظˆظ‡ ظ…ظ…ظ†ظˆط¹ ظ†ظ…غŒط¨ط§ط´ط¯ًں”“\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else 
data[tostring(target)]["settings"]["views"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "#Views _Posting Has Been Unlocked_\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
else
return "ط§ط±ط³ط§ظ„ #ظ¾ط³طھ ظˆغŒظˆ ط¯ط§ط± ط¯ط± ع¯ط±ظˆظ‡ ط¢ط²ط§ط¯ ط´ط¯ًں”“\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end
---------------Lock English-------------------
local function lock_english(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
 return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end

local lock_english = data[tostring(target)]["settings"]["english"] 
if lock_english == "yes" then
if not lang then
 return "âک†م€‹*Eخ·gâ„“خ¹ر•ذ½* _Pدƒر•ر‚خ¹خ·g Iر• Aâ„“رڈر”خ±âˆ‚رƒ Lدƒcذ؛ر”âˆ‚_ًں”’\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
elseif lang then
 return "âک†م€‹ظ†ظˆط´طھظ‡ ط§ظ†ع¯ظ„غŒط³غŒ ط¯ط± ع¯ط±ظˆظ‡ ط§ط² ظ‚ط¨ظ„ ظ…ظ…ظ†ظˆط¹ ط§ط³طھًں”’\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else
 data[tostring(target)]["settings"]["english"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "âک†م€‹*Eخ·gâ„“خ¹ر•ذ½* _Pدƒر•ر‚خ¹خ·g Hخ±ر• Bر”ر”خ· Lدƒcذ؛ر”âˆ‚_ًں”’\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
else
 return "âک†م€‹ظ†ظˆط´طھظ‡ ط§ظ†ع¯ظ„غŒط³غŒ ط¯ط± ع¯ط±ظˆظ‡ ظ…ظ…ظ†ظˆط¹ ط´ط¯ًں”’\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end

local function unlock_english(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
 return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end 
end

local lock_english = data[tostring(target)]["settings"]["english"]
 if lock_english == "no" then
if not lang then
return "âک†م€‹*ر”خ·gâ„“خ¹ر•ذ½* _Pدƒر•ر‚خ¹خ·g Iر• Nدƒر‚ Lدƒcذ؛ر”âˆ‚_ًں”“\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
elseif lang then
return "âک†م€‹ظ†ظˆط´طھظ‡ ط§ظ†ع¯ظ„غŒط³غŒ ط¯ط± ع¯ط±ظˆظ‡ ظ…ظ…ظ†ظˆط¹ ظ†ظ…غŒط¨ط§ط´ط¯ًں”“\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else 
data[tostring(target)]["settings"]["english"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "âک†م€‹*Eخ·gâ„“خ¹ر•ذ½* _Pدƒر•ر‚خ¹خ·g Hخ±ر• Bر”ر”خ· Uخ·â„“دƒcذ؛ر”âˆ‚_ًں”“\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
else
return "âک†م€‹ظ†ظˆط´طھظ‡ ط§ظ†ع¯ظ„غŒط³غŒ ط¯ط± ع¯ط±ظˆظ‡ ط¢ط²ط§ط¯ ط´ط¯ًں”“\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end
---------------Lock Emoji-------------------
local function lock_emoji(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
 return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end

local lock_emoji = data[tostring(target)]["settings"]["emoji"] 
if lock_emoji == "yes" then
if not lang then
 return "âک†م€‹*Eذ¼دƒ× خ¹* _Pدƒر•ر‚خ¹خ·g Iر• Aâ„“رڈر”خ±âˆ‚رƒ Lدƒcذ؛ر”âˆ‚_ًں”’\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
elseif lang then
 return "âک†م€‹ظ†ظˆط´طھظ‡ ط§غŒظ…ظˆط¬غŒ ط¯ط± ع¯ط±ظˆظ‡ ط§ط² ظ‚ط¨ظ„ ظ…ظ…ظ†ظˆط¹ ط§ط³طھًں”’\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else
 data[tostring(target)]["settings"]["emoji"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "âک†م€‹*Eذ¼دƒ× خ¹* _Pدƒر•ر‚خ¹خ·g Hخ±ر• Bر”ر”خ· Lدƒcذ؛ر”âˆ‚_ًں”’\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
else
 return "âک†م€‹ظ†ظˆط´طھظ‡ ط§غŒظ…ظˆط¬غŒ ط¯ط± ع¯ط±ظˆظ‡ ظ…ظ…ظ†ظˆط¹ ط´ط¯ًں”’\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end

local function unlock_emoji(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
 return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end 
end

local lock_emoji = data[tostring(target)]["settings"]["emoji"]
 if lock_emoji == "no" then
if not lang then
return "âک†م€‹*Eذ¼دƒ× خ¹* _Pدƒر•ر‚خ¹خ·g Iر• Nدƒر‚ Lدƒcذ؛ر”âˆ‚_ًں”“\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
elseif lang then
return "âک†م€‹ظ†ظˆط´طھظ‡ ط§غŒظ…ظˆط¬غŒ ط¯ط± ع¯ط±ظˆظ‡ ظ…ظ…ظ†ظˆط¹ ظ†ظ…غŒط¨ط§ط´ط¯ًں”“\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else 
data[tostring(target)]["settings"]["emoji"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "*Eذ¼دƒ× خ¹* _Pدƒر•ر‚خ¹خ·g Hخ±ر• Bر”ر”خ· Uخ·â„“دƒcذ؛ر”âˆ‚_ًں”“\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
else
return "âک†م€‹ظ†ظˆط´طھظ‡ ط§غŒظ…ظˆط¬غŒ ط¯ط± ع¯ط±ظˆظ‡ ط¢ط²ط§ط¯ ط´ط¯ًں”“\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end
---------------Lock Ads-------------------
local function lock_ads(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
 return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end

local lock_ads = data[tostring(target)]["settings"]["ads"] 
if lock_ads == "yes" then
if not lang then
 return "âک†م€‹*Aâˆ‚ر•* _Pدƒر•ر‚خ¹خ·g Iر• Aâ„“رڈر”خ±âˆ‚رƒ Lدƒcذ؛ر”âˆ‚_ًں”’\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
elseif lang then
 return "âک†م€‹ط§ط±ط³ط§ظ„ طھط¨ظ„غŒط؛ط§طھ ط¯ط± ع¯ط±ظˆظ‡ ط§ط² ظ‚ط¨ظ„ ظ…ظ…ظ†ظˆط¹ ط§ط³طھًں”’\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else
 data[tostring(target)]["settings"]["ads"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "âک†م€‹*Aâˆ‚ر•* _Pدƒر•ر‚خ¹خ·g Hخ±ر• Bر”ر”خ· Lدƒcذ؛ر”âˆ‚_\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
else
 return "âک†م€‹ط§ط±ط³ط§ظ„ طھط¨ظ„غŒط؛ط§طھ ط¯ط± ع¯ط±ظˆظ‡ ظ…ظ…ظ†ظˆط¹ ط´ط¯\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end

local function unlock_ads(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
 return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end 
end

local lock_ads = data[tostring(target)]["settings"]["ads"]
 if lock_ads == "no" then
if not lang then
return "âک†م€‹*خ±âˆ‚ر•* _Pدƒر•ر‚خ¹خ·g Iر• Nدƒر‚ Lدƒcذ؛ر”âˆ‚_ًں”“\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
elseif lang then
return "ط§ط±ط³ط§ظ„ طھط¨ظ„غŒط؛ط§طھ ط¯ط± ع¯ط±ظˆظ‡ ظ…ظ…ظ†ظˆط¹ ظ†ظ…غŒط¨ط§ط´ط¯ًں”“\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else 
data[tostring(target)]["settings"]["ads"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "âک†م€‹*Aâˆ‚ر•* _Pدƒر•ر‚خ¹خ·g Hخ±ر• Bر”ر”خ· Uخ·â„“دƒcذ؛ر”âˆ‚_ًں”“\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
else
return "âک†م€‹ط§ط±ط³ط§ظ„ طھط¨ظ„غŒط؛ط§طھ ط¯ط± ع¯ط±ظˆظ‡ ط¢ط²ط§ط¯ ط´ط¯ًں”“\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end
---------------Lock Fosh-------------------
local function lock_fosh(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "ط´ظ…ط§ ظ…ط¯غŒط± ع¯ط±ظˆظ‡ ظ†ظ…غŒط¨ط§ط´غŒط¯"
end
end

local lock_fosh = data[tostring(target)]["settings"]["fosh"] 
if lock_fosh == "yes" then
if not lang then
 return "#Fosh _Posting Is Already Locked_\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
elseif lang then
 return "ط§ط±ط³ط§ظ„ #ع©ظ„ظ…ط§طھ ط±ع©غŒع© ط¯ط± ع¯ط±ظˆظ‡ ظ‡ظ… ط§ع©ظ†ظˆظ† ظ…ظ…ظ†ظˆط¹ ط§ط³طھًں”’\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else
 data[tostring(target)]["settings"]["fosh"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "#Fosh _Posting Has Been Locked_\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
else
 return "ط§ط±ط³ط§ظ„ #ع©ظ„ظ…ط§طھ ط±ع©غŒع© ط¯ط± ع¯ط±ظˆظ‡ ظ…ظ…ظ†ظˆط¹ ط´ط¯ًں”’\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end

local function unlock_fosh(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
 return "ط´ظ…ط§ ظ…ط¯غŒط± ع¯ط±ظˆظ‡ ظ†ظ…غŒط¨ط§ط´غŒط¯"
end 
end

local lock_fosh = data[tostring(target)]["settings"]["english"]
 if lock_fosh == "no" then
if not lang then
return "#Fosh _Posting Is Not Locked_\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
elseif lang then
return "ط§ط±ط³ط§ظ„ #ع©ظ„ظ…ط§طھ ط±ع©غŒع© ط¯ط± ع¯ط±ظˆظ‡ ظ…ظ…ظ†ظˆط¹ ظ†ظ…غŒط¨ط§ط´ط¯ًں”“\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else 
data[tostring(target)]["settings"]["fosh"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "#Fosh _Posting Has Been Unlocked_\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
else
return "ط§ط±ط³ط§ظ„ #ع©ظ„ظ…ط§طھ ط±ع©غŒع© ط¯ط± ع¯ط±ظˆظ‡ ط¢ط²ط§ط¯ ط´ط¯ًں”“\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end
---------------Lock Mention-------------------
local function lock_mention(msg, data, target)
 local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
 return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end

local lock_mention = data[tostring(target)]["settings"]["lock_mention"] 
if lock_mention == "yes" then
if not lang then
 return "âک†م€‹*Mر”خ·ر‚خ¹دƒخ·* _Pدƒر•ر‚خ¹خ·g Iر• Aâ„“رڈر”خ±âˆ‚رƒ Lدƒcذ؛ر”âˆ‚_ًں”’\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
elseif lang then
 return "âک†م€‹ط§ط±ط³ط§ظ„ #ظپط±ط§ط®ظˆط§ظ†غŒ ط¯ط± ع¯ط±ظˆظ‡  ط§ط² ظ‚ط¨ظ„ط§ ظ…ظ…ظ†ظˆط¹ ط§ط³طھًں”’\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else
 data[tostring(target)]["settings"]["lock_mention"] = "yes"
save_data(_config.moderation.data, data)
if not lang then 
 return "âک†م€‹*Mر”خ·ر‚خ¹دƒخ·* _Pدƒر•ر‚خ¹خ·g Hخ±ر• Bر”ر”خ· Lدƒcذ؛ر”âˆ‚_ًں”’\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
else 
 return "âک†م€‹ط§ط±ط³ط§ظ„ #ظپط±ط§ط®ظˆط§ظ†غŒ ط¯ط± ع¯ط±ظˆظ‡ ظ…ظ…ظ†ظˆط¹ ط´ط¯ًں”’\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end

local function unlock_mention(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end 

local lock_mention = data[tostring(target)]["settings"]["lock_mention"]
 if lock_mention == "no" then
if not lang then
return "âک†م€‹*Mر”خ·ر‚خ¹دƒخ·* _Pدƒر•ر‚خ¹خ·g Iر• Nدƒر‚ Lدƒcذ؛ر”âˆ‚_ًں”“\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
elseif lang then
return "âک†م€‹ط§ط±ط³ط§ظ„ #ظپط±ط§ط®ظˆط§ظ†غŒ ط¯ط± ع¯ط±ظˆظ‡  ط§ط² ظ‚ط¨ظ„ط§ ظ…ظ…ظ†ظˆط¹ ظ†غŒط³طھًں”“\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else 
data[tostring(target)]["settings"]["lock_mention"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "âک†م€‹*Mر”خ·ر‚خ¹دƒخ·* _Pدƒر•ر‚خ¹خ·g Hخ±ر• Bر”ر”خ· Uخ·â„“دƒcذ؛ر”âˆ‚_ًں”“\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
else
return "âک†م€‹ط§ط±ط³ط§ظ„ # ظپط±ط§ط®ظˆط§ظ†غŒ ط¯ط± ع¯ط±ظˆظ‡  ط§ط²ط§ط¯ ط´ط¯ًں”“\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end

---------------Lock Arabic--------------
local function lock_arabic(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
 return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end

local lock_arabic = data[tostring(target)]["settings"]["lock_arabic"] 
if lock_arabic == "yes" then
if not lang then
 return "âک†م€‹*Pر”رڈر•خ¹خ±خ·* _Pدƒر•ر‚خ¹خ·g Iر• Aâ„“رڈر”خ±âˆ‚رƒ Lدƒcذ؛ر”âˆ‚_ًں”’\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
elseif lang then
 return "âک†م€‹ط§ط±ط³ط§ظ„ #ع©ظ„ظ…ط§طھ ظپط§ط±ط³غŒ ط¯ط± ع¯ط±ظˆظ‡  ط§ط² ظ‚ط¨ظ„ط§ ظ…ظ…ظ†ظˆط¹ ط§ط³طھًں”’\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else
data[tostring(target)]["settings"]["lock_arabic"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "âک†م€‹*Pر”رڈر•خ¹خ±خ·* _Pدƒر•ر‚خ¹خ·g Hخ±ر• Bر”ر”خ· Lدƒcذ؛ر”âˆ‚_ًں”’\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
else
 return "âک†م€‹ط§ط±ط³ط§ظ„ #ع©ظ„ظ…ط§طھ ظپط§ط±ط³غŒ ط¯ط± ع¯ط±ظˆظ‡ ظ…ظ…ظ†ظˆط¹ ط´ط¯ًں”’\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end

local function unlock_arabic(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end 

local lock_arabic = data[tostring(target)]["settings"]["lock_arabic"]
 if lock_arabic == "no" then
if not lang then
return "âک†م€‹*Pر”رڈر•خ¹خ±خ·* _Pدƒر•ر‚خ¹خ·g Iر• Nدƒر‚ Lدƒcذ؛ر”âˆ‚_ًں”“\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
elseif lang then
return "âک†م€‹ط§ط±ط³ط§ظ„ #ع©ظ„ظ…ط§طھ ظپط§ط±ط³غŒ ط¯ط± ع¯ط±ظˆظ‡  ط§ط² ظ‚ط¨ظ„ط§ ظ…ظ…ظ†ظˆط¹ ظ†غŒط³طھًں”“\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else 
data[tostring(target)]["settings"]["lock_arabic"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "âک†م€‹*Pر”رڈر•خ¹خ±خ·* _Pدƒر•ر‚خ¹خ·g Hخ±ر• Bر”ر”خ· Uخ·â„“دƒcذ؛ر”âˆ‚_ًں”“\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
else
return "âک†م€‹ط§ط±ط³ط§ظ„ # ع©ظ„ظ…ط§طھ ظپط§ط±ط³غŒ ط¯ط± ع¯ط±ظˆظ‡  ط§ط²ط§ط¯ ط´ط¯ًں”“\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end
---------------Lock Edit-------------------
local function lock_edit(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
 return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end

local lock_edit = data[tostring(target)]["settings"]["lock_edit"] 
if lock_edit == "yes" then
if not lang then
 return "âک†م€‹*Eâˆ‚خ¹ر‚خ¹خ·g* _Iر• Aâ„“رڈر”خ±âˆ‚رƒ Lدƒcذ؛ر”âˆ‚_ًں”’\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
elseif lang then
 return "âک†م€‹#ظˆغŒط±ط§غŒط´ ظ¾غŒط§ظ… ط¯ط± ع¯ط±ظˆظ‡  ط§ط² ظ‚ط¨ظ„ ظ…ظ…ظ†ظˆط¹ ط§ط³طھًں”’\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else
 data[tostring(target)]["settings"]["lock_edit"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "âک†م€‹*Eâˆ‚خ¹ر‚خ¹خ·g* _Hخ±ر• Bر”ر”خ· Lدƒcذ؛ر”âˆ‚_ًں”’\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
else
 return "âک†م€‹#ظˆغŒط±ط§غŒط´ ظ¾غŒط§ظ… ط¯ط± ع¯ط±ظˆظ‡ ظ…ظ…ظ†ظˆط¹ ط´ط¯ًں”’\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end

local function unlock_edit(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end 

local lock_edit = data[tostring(target)]["settings"]["lock_edit"]
 if lock_edit == "no" then
if not lang then
return "âک†م€‹*Eâˆ‚خ¹ر‚خ¹خ·g* _Iر• Nدƒر‚ Lدƒcذ؛ر”âˆ‚_ًں”“\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
elseif lang then
return "âک†م€‹#ظˆغŒط±ط§غŒط´ ظ¾غŒط§ظ… ط¯ط± ع¯ط±ظˆظ‡ ط§ط² ظ‚ط¨ظ„ ظ…ظ…ظ†ظˆط¹ ظ†غŒط³طھًں”“\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else 
data[tostring(target)]["settings"]["lock_edit"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "âک†م€‹*Eâˆ‚خ¹ر‚خ¹خ·g* _Hخ±ر• Bر”ر”خ· Uخ·â„“دƒcذ؛ر”âˆ‚_ًں”“\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
else
return "âک†م€‹#ظˆغŒط±ط§غŒط´ ظ¾غŒط§ظ… ط¯ط± ع¯ط±ظˆظ‡ ط§ط²ط§ط¯ ط§ط³طھًں”“\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end
---------------Lock spam-------------------
local function lock_spam(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
 return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end

local lock_spam = data[tostring(target)]["settings"]["lock_spam"] 
if lock_spam == "yes" then
if not lang then
 return "âک†م€‹*Sدپخ±ذ¼* _Iر• Aâ„“رڈر”خ±âˆ‚رƒ Lدƒcذ؛ر”âˆ‚_ًں”’\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
elseif lang then
 return "âک†م€‹ط§ط±ط³ط§ظ„ #ظ‡ط±ط²ظ†ط§ظ…ظ‡ ( ط§ط³ظ¾ظ…) ط¯ط± ع¯ط±ظˆظ‡  ط§ط² ظ‚ط¨ظ„ط§ ظ…ظ…ظ†ظˆط¹ ط§ط³طھًں”’\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else
 data[tostring(target)]["settings"]["lock_spam"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "âک†م€‹*Sدپخ±ذ¼* _Hخ±ر• Bر”ر”خ· Lدƒcذ؛ر”âˆ‚_ًں”’\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
else
 return "âک†م€‹ط§ط±ط³ط§ظ„ #ظ‡ط±ط²ظ†ط§ظ…ظ‡ ( ط§ط³ظ¾ظ…) ط¯ط± ع¯ط±ظˆظ‡ ظ…ظ…ظ†ظˆط¹ ط´ط¯ًں”’\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end

local function unlock_spam(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end 

local lock_spam = data[tostring(target)]["settings"]["lock_spam"]
 if lock_spam == "no" then
if not lang then
return "âک†م€‹*Sدپخ±ذ¼* _Pدƒر•ر‚خ¹خ·g Iر• Nدƒر‚ Lدƒcذ؛ر”âˆ‚_ًں”“\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
elseif lang then
 return "âک†م€‹ط§ط±ط³ط§ظ„ #ظ‡ط±ط²ظ†ط§ظ…ظ‡ (ط§ط³ظ¾ظ…) ط¯ط± ع¯ط±ظˆظ‡  ط§ط² ظ‚ط¨ظ„ط§ ظ…ظ…ظ†ظˆط¹ ظ†غŒط³طھًں”“\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else 
data[tostring(target)]["settings"]["lock_spam"] = "no" 
save_data(_config.moderation.data, data)
if not lang then 
return "âک†م€‹*Sدپخ±ذ¼* _Pدƒر•ر‚خ¹خ·g Hخ±ر• Bر”ر”خ· Uخ·â„“دƒcذ؛ر”âˆ‚_ًں”“\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
else
 return "âک†م€‹ط§ط±ط³ط§ظ„ #ظ‡ط±ط²ظ†ط§ظ…ظ‡ (ط§ط³ظ¾ظ…) ط¯ط± ع¯ط±ظˆظ‡  ط§ط²ط§ط¯ ط´ط¯ًں”“\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end
---------------Lock Flood-------------------
local function lock_flood(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
 return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end

local lock_flood = data[tostring(target)]["settings"]["flood"] 
if lock_flood == "yes" then
if not lang then
 return "âک†م€‹*Fâ„“دƒدƒâˆ‚خ¹خ·g* _Iر• Aâ„“رڈر”خ±âˆ‚رƒ Lدƒcذ؛ر”âˆ‚_ًں”’\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
elseif lang then
 return "âک†م€‹ط§ط±ط³ط§ظ„ #ظ¾غŒط§ظ… ظ…ع©ط±ط± ط¯ط± ع¯ط±ظˆظ‡  ط§ط² ظ‚ط¨ظ„ط§ ظ…ظ…ظ†ظˆط¹ ط§ط³طھًں”’\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else
 data[tostring(target)]["settings"]["flood"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "âک†م€‹*Fâ„“دƒدƒâˆ‚خ¹خ·g* _Hخ±ر• Bر”ر”خ· Lدƒcذ؛ر”âˆ‚_ًں”’\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
else
 return "âک†م€‹ط§ط±ط³ط§ظ„ # ظ¾غŒط§ظ… ظ…ع©ط±ط± ط¯ط± ع¯ط±ظˆظ‡ ظ…ظ…ظ†ظˆط¹ ط´ط¯ًں”’\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end

local function unlock_flood(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end 

local lock_flood = data[tostring(target)]["settings"]["flood"]
 if lock_flood == "no" then
if not lang then
return "âک†م€‹*Fâ„“دƒدƒâˆ‚خ¹خ·g* _Iر• Nدƒر‚ Lدƒcذ؛ر”âˆ‚_ًں”“\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
elseif lang then
return "âک†م€‹ط§ط±ط³ط§ظ„ #ظ¾غŒط§ظ… ظ…ع©ط±ط± ط¯ط± ع¯ط±ظˆظ‡  ط§ط² ظ‚ط¨ظ„ط§ ظ…ظ…ظ†ظˆط¹ ظ†غŒط³طھًں”“\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else 
data[tostring(target)]["settings"]["flood"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "âک†م€‹*Fâ„“دƒدƒâˆ‚خ¹خ·g*  _Hخ±ر• Bر”ر”خ· Uخ·â„“دƒcذ؛ر”âˆ‚_ًں”“\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
else
return "âک†م€‹ط§ط±ط³ط§ظ„ #ظ¾غŒط§ظ… ظ…ع©ط±ط± ط¯ط± ع¯ط±ظˆظ‡  ط§ط²ط§ط¯ ط´ط¯ًں”“\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end
---------------Lock Bots-------------------
local function lock_bots(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
 return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end

local lock_bots = data[tostring(target)]["settings"]["lock_bots"] 
if lock_bots == "yes" then
if not lang then
 return "âک†م€‹*Bدƒر‚ر•* _Pرڈدƒر‚ر”cر‚خ¹دƒخ· Iر• Aâ„“رڈر”خ±âˆ‚رƒ Eخ·خ±ذ²â„“ر”âˆ‚_ًں”’\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
elseif lang then
 return "âک†م€‹#ظ…ط­ط§ظپط¸طھ ط§ط² ع¯ط±ظˆظ‡ ط¯ط± ط¨ط±ط§ط¨ط± ط±ط¨ط§طھ ظ‡ط§ ط§ط² ظ‚ط¨ظ„ ظپط¹ط§ظ„ ط§ط³طھًں”’\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else
 data[tostring(target)]["settings"]["lock_bots"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "âک†م€‹*Bدƒر‚ر•* _Pرڈدƒر‚ر”cر‚خ¹دƒخ· Hخ±ر• Bر”ر”خ· Eخ·خ±ذ²â„“ر”âˆ‚_ًں”’\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
else
 return "âک†م€‹#ظ…ط­ط§ظپط¸طھ ط§ط² ع¯ط±ظˆظ‡ ط¯ط± ط¨ط±ط§ط¨ط± ط±ط¨ط§طھ ظ‡ط§  ظپط¹ط§ظ„ ط´ط¯ًں”’\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end

local function unlock_bots(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end 
end

local lock_bots = data[tostring(target)]["settings"]["lock_bots"]
 if lock_bots == "no" then
if not lang then
return "âک†م€‹*Bدƒر‚ر•* _Pرڈدƒر‚ر”cر‚خ¹دƒخ· Iر• Nدƒر‚ Eخ·خ±ذ²â„“ر”âˆ‚_ًں”“\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
elseif lang then
return "ظ…ط­ط§ظپط¸طھ ط§ط² ع¯ط±ظˆظ‡ ط¯ط± ط¨ط±ط§ط¨ط± ط±ط¨ط§طھ ظ‡ط§ ط؛غŒط± ظپط¹ط§ظ„ ط§ط³طھ\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else 
data[tostring(target)]["settings"]["lock_bots"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "âک†م€‹*Bدƒر‚ر•* _Pرڈدƒر‚ر”cر‚خ¹دƒخ· Hخ±ر• Bر”ر”خ· Dخ¹ر•خ±ذ²â„“ر”âˆ‚_ًں”“\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
else
return "âک†م€‹#ظ…ط­ط§ظپط¸طھ ط§ط² ع¯ط±ظˆظ‡ ط¯ط± ط¨ط±ط§ط¨ط± ط±ط¨ط§طھ ظ‡ط§  ط§ط²ط§ط¯ ط§ط³طھًں”’\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end
---------------Lock Markdown-------------------
local function lock_markdown(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
 return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end

local lock_markdown = data[tostring(target)]["settings"]["lock_markdown"] 
if lock_markdown == "yes" then
if not lang then 
 return "âک†م€‹*Mخ±رڈذ؛âˆ‚دƒد‰خ·* _Pدƒر•ر‚خ¹خ·g Iر• Aâ„“رڈر”خ±âˆ‚رƒ Lدƒcذ؛ر”âˆ‚_ًں”’\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
elseif lang then
 return "âک†م€‹ط§ط±ط³ط§ظ„ #ظ¾غŒط§ظ… ط¯ط§ط±ط§غŒ ظپظˆظ†طھ ط¯ط± ع¯ط±ظˆظ‡  ط§ط² ظ‚ط¨ظ„ط§ ظ…ظ…ظ†ظˆط¹ ط§ط³طھًں”’\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else
 data[tostring(target)]["settings"]["lock_markdown"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "âک†م€‹*Mخ±رڈذ؛âˆ‚دƒد‰خ·* _Pدƒر•ر‚خ¹خ·g Hخ±ر• Bر”ر”خ· Lدƒcذ؛ر”âˆ‚_ًں”’\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
else
 return "âک†م€‹ط§ط±ط³ط§ظ„ #ظ¾غŒط§ظ… ط¯ط§ط±ط§غŒ ظپظˆظ†طھ ط¯ط± ع¯ط±ظˆظ‡ ظ…ظ…ظ†ظˆط¹ ط´ط¯ًں”’\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end

local function unlock_markdown(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end 
end

local lock_markdown = data[tostring(target)]["settings"]["lock_markdown"]
 if lock_markdown == "no" then
if not lang then
return "âک†م€‹*Mخ±رڈذ؛âˆ‚دƒد‰خ·* _Pدƒر•ر‚خ¹خ·g Iر• Nدƒر‚ Lدƒcذ؛ر”âˆ‚_ًں”“\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
elseif lang then
return "âک†م€‹ط§ط±ط³ط§ظ„ #ظ¾غŒط§ظ… ط¯ط§ط±ط§غŒ ظپظˆظ†طھ ط¯ط± ع¯ط±ظˆظ‡  ط§ط² ظ‚ط¨ظ„ط§ ظ…ظ…ظ†ظˆط¹ ظ†غŒط³طھًں”“\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else 
data[tostring(target)]["settings"]["lock_markdown"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "âک†م€‹*Mخ±رڈذ؛âˆ‚دƒد‰خ·* _Pدƒر•ر‚خ¹خ·g Hخ±ر• Bر”ر”خ· Uخ·â„“دƒcذ؛ر”âˆ‚_ًں”“\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
else
return "âک†م€‹ط§ط±ط³ط§ظ„ #ظ¾غŒط§ظ… ط¯ط±ط§غŒ ظپظˆظ†طھ ط¯ط± ع¯ط±ظˆظ‡  ط§ط²ط§ط¯ ط´ط¯ًں”“\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end
---------------Lock Webpage-------------------
local function lock_webpage(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
 return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end

local lock_webpage = data[tostring(target)]["settings"]["lock_webpage"] 
if lock_webpage == "yes" then
if not lang then
 return "âک†م€‹*Wر”ذ²دپخ±gر”* _Iر• Aâ„“رڈر”خ±âˆ‚رƒ Lدƒcذ؛ر”âˆ‚_ًں”’\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
elseif lang then
 return "âک†م€‹ط§ط±ط³ط§ظ„ #طµظپط­ط§طھ ظˆط¨ ط¯ط± ع¯ط±ظˆظ‡  ط§ط² ظ‚ط¨ظ„ط§ ظ…ظ…ظ†ظˆط¹ ط§ط³طھًں”’\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else
 data[tostring(target)]["settings"]["lock_webpage"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "âک†م€‹*Wر”ذ²دپخ±gر”* _Hخ±ر• Bر”ر”خ· Lدƒcذ؛ر”âˆ‚_ًں”’\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
else
 return "âک†م€‹ط§ط±ط³ط§ظ„ #طµظپط­ط§طھ ظˆط¨ ط¯ط± ع¯ط±ظˆظ‡ ظ…ظ…ظ†ظˆط¹ ط´ط¯ًں”’\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end

local function unlock_webpage(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
return "م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end 
end

local lock_webpage = data[tostring(target)]["settings"]["lock_webpage"]
 if lock_webpage == "no" then
if not lang then
return "âک†م€‹*Wر”ذ²دپخ±gر”* _Iر• Nدƒر‚ Lدƒcذ؛ر”âˆ‚_ًں”“\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
elseif lang then
return "âک†م€‹ط§ط±ط³ط§ظ„ #طµظپط­ط§طھ ظˆط¨ ط¯ط± ع¯ط±ظˆظ‡  ط§ط² ظ‚ط¨ظ„ ظ…ظ…ظ†ظˆط¹ ظ†غŒط³طھًں”“\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else 
data[tostring(target)]["settings"]["lock_webpage"] = "no"
save_data(_config.moderation.data, data) 
if not lang then
return "âک†م€‹*Wر”ذ²دپخ±gر”* _Hخ±ر• Bر”ر”خ· Uخ·â„“دƒcذ؛ر”âˆ‚_ًں”“\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
else
return "âک†م€‹ط§ط±ط³ط§ظ„ #طµظپط­ط§طھ ظˆط¨ ط¯ط± ع¯ط±ظˆظ‡  ط§ط²ط§ط¯ ط´ط¯ًں”“\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end
---------------Lock Pin-------------------
local function lock_pin(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
 return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end

local lock_pin = data[tostring(target)]["settings"]["lock_pin"] 
if lock_pin == "yes" then
if not lang then
 return "âک†م€‹*Pخ¹خ·خ·ر”âˆ‚ Mر”ر•ر•خ±gر”* _Iر• Aâ„“رڈر”خ±âˆ‚رƒ Lدƒcذ؛ر”âˆ‚_ًں”’\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
elseif lang then
 return "âک†م€‹ط³ظ†ط¬ط§ظ‚ ع©ط±ط¯ظ† ظ¾غŒط§ظ… ط¯ط± ع¯ط±ظˆظ‡ ط§ط² ظ‚ط¨ظ„ ظ…ظ…ظ†ظˆط¹ ط§ط³طھًں”’\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else
 data[tostring(target)]["settings"]["lock_pin"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "âک†م€‹*Pخ¹خ·خ·ر”âˆ‚ Mر”ر•ر•خ±gر”* _Hخ±ر• Bر”ر”خ· Lدƒcذ؛ر”âˆ‚_ًں”’\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
else
 return "âک†م€‹ط³ظ†ط¬ط§ظ‚ ع©ط±ط¯ظ† ظ¾غŒط§ظ… ط¯ط± ع¯ط±ظˆظ‡ ظ…ظ…ظ†ظˆط¹ ط´ط¯ًں”’\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end

local function unlock_pin(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end 
end

local lock_pin = data[tostring(target)]["settings"]["lock_pin"]
 if lock_pin == "no" then
if not lang then
return "âک†م€‹*Pخ¹خ·خ·ر”âˆ‚ Mر”ر•ر•خ±gر”* _Iر• Nدƒر‚ Lدƒcذ؛ر”âˆ‚_ًں”“\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
elseif lang then
return "âک†م€‹ط³ظ†ط¬ط§ظ‚ ع©ط±ط¯ظ† ظ¾غŒط§ظ… ط¯ط± ع¯ط±ظˆظ‡ ظ…ظ…ظ†ظˆط¹ ظ†ظ…غŒط¨ط§ط´ط¯ًں”“\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else 
data[tostring(target)]["settings"]["lock_pin"] = "no"
save_data(_config.moderation.data, data) 
if not lang then
return "âک†م€‹*Pخ¹خ·خ·ر”âˆ‚ Mر”ر•ر•خ±gر”* _Hخ±ر• Bر”ر”خ· Uخ·â„“دƒcذ؛ر”âˆ‚_ًں”“\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
else
return "âک†م€‹ط³ظ†ط¬ط§ظ‚ ع©ط±ط¯ظ† ظ¾غŒط§ظ… ط¯ط± ع¯ط±ظˆظ‡ ط¢ط²ط§ط¯ ط´ط¯ًں”“\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end
--------------Lock Tabchi-------------
local function lock_tabchi(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end

local lock_tabchi = data[tostring(target)]["settings"]["lock_tabchi"] 
if lock_tabchi == "yes" then
if not lang then
 return "*Tabchi* _Posting Is Already Locked_\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
elseif lang then
 return "ط§ظˆط±ط¯ظ† طھط¨ع†غŒ ط¯ط± ع¯ط±ظˆظ‡ ظ‡ظ… ط§ع©ظ†ظˆظ† ظ…ظ…ظ†ظˆط¹ ط§ط³طھ\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else
data[tostring(target)]["settings"]["lock_tabchi"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*Tabchi* _Posting Has Been Locked_\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
else
 return "ط§ظˆط±ط¯ظ† طھط¨ع†غŒ ط¯ط± ع¯ط±ظˆظ‡ ظ…ظ…ظ†ظˆط¹ ط´ط¯\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end

local function unlock_tabchi(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end 

local lock_tabchi = data[tostring(target)]["settings"]["lock_tabchi"]
 if lock_tabchi == "no" then
if not lang then
return "*Tabchi* _Posting Is Not Locked_\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
elseif lang then
return "ط§ظˆط±ط¯ظ† طھط¨ع†غŒ ط¯ط± ع¯ط±ظˆظ‡ ظ…ظ…ظ†ظˆط¹ ظ†ظ…غŒط¨ط§ط´ط¯\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else 
data[tostring(target)]["settings"]["lock_tabchi"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "*Tabchi* _Posting Has Been Unlocked_\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
else
return "ط§ظˆط±ط¯ظ† طھط¨ع†غŒ ط¯ط± ع¯ط±ظˆظ‡ ط¢ط²ط§ط¯ ط´ط¯\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end

--------Mutes---------
--------Mute all--------------------------
local function mute_all(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then 
if not lang then
return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·" 
else
return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end

local mute_all = data[tostring(target)]["settings"]["mute_all"] 
if mute_all == "yes" then 
if not lang then
return "âک†م€‹*Mد…ر‚ر” Aâ„“â„“* _Iر• Aâ„“رڈر”خ±âˆ‚رƒ Eخ·خ±ذ²â„“ر”âˆ‚_ًں”‡\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
elseif lang then
return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ظ‡ظ…ظ‡  ط§ط² ظ‚ط¨ظ„ ظپط¹ط§ظ„ ط§ط³طھًں”‡\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else 
data[tostring(target)]["settings"]["mute_all"] = "yes"
 save_data(_config.moderation.data, data) 
if not lang then
return "âک†م€‹*Mد…ر‚ر” Aâ„“â„“* _Hخ±ر• Bر”ر”خ· Eخ·خ±ذ²â„“ر”âˆ‚_ًں”‡\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
else
return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ظ‡ظ…ظ‡ ظپط¹ط§ظ„ ط´ط¯ًں”‡\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end

local function unmute_all(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then 
if not lang then
return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·" 
else
return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end

local mute_all = data[tostring(target)]["settings"]["mute_all"] 
if mute_all == "no" then 
if not lang then
return "âک†م€‹*Mد…ر‚ر” Aâ„“â„“* _Iر• Aâ„“رڈر”خ±âˆ‚رƒ Dخ¹ر•خ±ذ²â„“ر”âˆ‚_ًں”ٹ\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
elseif lang then
return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ظ‡ظ…ظ‡ ظپط¹ط§ظ„ ظ†غŒط³طھًں”ٹ\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else 
data[tostring(target)]["settings"]["mute_all"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "âک†م€‹*Mد…ر‚ر” Aâ„“â„“* _Hخ±ر• Bر”ر”خ· Dخ¹ر•خ±ذ²â„“ر”âˆ‚_ًں”ٹ\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
else
return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ظ‡ظ…ظ‡ ط؛غŒط± ظپط¹ط§ظ„ ط´ط¯ًں”ٹ\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end 
end
end

---------------Mute Gif-------------------
local function mute_gif(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
 return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end

local mute_gif = data[tostring(target)]["settings"]["mute_gif"] 
if mute_gif == "yes" then
if not lang then
 return "âک†م€‹*Mد…ر‚ر” Gخ¹ئ’* _Iر• Aâ„“رڈر”خ±âˆ‚رƒ Eخ·خ±ذ²â„“ر”âˆ‚_ًں”‡\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
elseif lang then
 return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #طھطµط§ظˆغŒط± ظ…طھط­ط±ع©  ط§ط² ظ‚ط¨ظ„ ظپط¹ط§ظ„ ط§ط³طھًں”‡\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else
 data[tostring(target)]["settings"]["mute_gif"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then 
 return "âک†م€‹*Mد…ر‚ر” Gخ¹ئ’* _Hخ±ر• Bر”ر”خ· Eخ·خ±ذ²â„“ر”âˆ‚_ًں”‡\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
else
 return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #طھطµط§ظˆغŒط± ظ…طھط­ط±ع© ظپط¹ط§ظ„ ط´ط¯ًں”‡\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end

local function unmute_gif(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end 

local mute_gif = data[tostring(target)]["settings"]["mute_gif"]
 if mute_gif == "no" then
if not lang then
return "âک†م€‹*Mد…ر‚ر” Gخ¹ئ’* _Iر• Aâ„“رڈر”خ±âˆ‚رƒ Dخ¹ر•خ±ذ²â„“ر”âˆ‚_ًں”ٹ\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
elseif lang then
return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #طھطµط§ظˆغŒط± ظ…طھط­ط±ع© ظپط¹ط§ظ„ ظ†غŒط³طھًں”ٹ\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else 
data[tostring(target)]["settings"]["mute_gif"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "âک†م€‹*Mد…ر‚ر” Gخ¹ئ’* _Hخ±ر• Bر”ر”خ· Dخ¹ر•خ±ذ²â„“ر”âˆ‚_ًں”ٹ\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
else
return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† # طھطµط§ظˆغŒط± ظ…طھط­ط±ع© ط؛غŒط± ظپط¹ط§ظ„ ط´ط¯ًں”ٹ\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end
---------------Mute Game-------------------
local function mute_game(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
 return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end

local mute_game = data[tostring(target)]["settings"]["mute_game"] 
if mute_game == "yes" then
if not lang then
 return "âک†م€‹*Mد…ر‚ر” Gخ±ذ¼ر”* _Iر• Aâ„“رڈر”خ±âˆ‚رƒ Eخ·خ±ذ²â„“ر”âˆ‚_ًں”‡\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
elseif lang then
 return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ط¨ط§ط²غŒ ظ‡ط§غŒ طھط­طھ ظˆط¨  ط§ط² ظ‚ط¨ظ„ ظپط¹ط§ظ„ ط§ط³طھًں”‡\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else
 data[tostring(target)]["settings"]["mute_game"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "âک†م€‹*Mد…ر‚ر” Gخ±ذ¼ر”* _Hخ±ر• Bر”ر”خ· Eخ·خ±ذ²â„“ر”âˆ‚_ًں”‡\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
else
 return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ط¨ط§ط²غŒ ظ‡ط§غŒ طھط­طھ ظˆط¨   ظپط¹ط§ظ„ ط´ط¯ًں”‡\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end

local function unmute_game(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end 
end

local mute_game = data[tostring(target)]["settings"]["mute_game"]
 if mute_game == "no" then
if not lang then
return "âک†م€‹*Mد…ر‚ر” Gخ±ذ¼ر”* _Iر• Aâ„“رڈر”خ±âˆ‚رƒ Dخ¹ر•خ±ذ²â„“ر”âˆ‚_ًں”ٹ\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
elseif lang then
return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ط¨ط§ط²غŒ ظ‡ط§غŒ طھط­طھ ظˆط¨   ظپط¹ط§ظ„ ظ†غŒط³طھًں”ٹ\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else 
data[tostring(target)]["settings"]["mute_game"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
return "âک†م€‹*Mد…ر‚ر” Gخ±ذ¼ر”* _Hخ±ر• Bر”ر”خ· Dخ¹ر•خ±ذ²â„“ر”âˆ‚_ًں”ٹ\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
else
return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ط¨ط§ط²غŒ ظ‡ط§غŒ طھط­طھ ظˆط¨  ط؛غŒط± ظپط¹ط§ظ„ ط´ط¯ًں”ٹ\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end
---------------Mute Inline-------------------
local function mute_inline(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
 return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end

local mute_inline = data[tostring(target)]["settings"]["mute_inline"] 
if mute_inline == "yes" then
if not lang then
 return "âک†م€‹*Mد…ر‚ر” Iخ·â„“خ¹خ·ر”* _Iر• Aâ„“رڈر”خ±âˆ‚رƒ Eخ·خ±ذ²â„“ر”âˆ‚_ًں”‡\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
elseif lang then
 return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ع©غŒط¨ظˆط±ط¯ ط´غŒط´ظ‡ ط§غŒ ط§ط² ظ‚ط¨ظ„ ظپط¹ط§ظ„ ط§ط³طھًں”ٹ\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else
 data[tostring(target)]["settings"]["mute_inline"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "âک†م€‹*Mد…ر‚ر” Iخ·â„“خ¹خ·ر”* _Hخ±ر• Bر”ر”خ· Eخ·خ±ذ²â„“ر”âˆ‚_ًں”‡\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
else
 return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ع©غŒط¨ظˆط±ط¯ ط´غŒط´ظ‡ ط§غŒ ظپط¹ط§ظ„ ط´ط¯ًں”‡\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end

local function unmute_inline(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end 

local mute_inline = data[tostring(target)]["settings"]["mute_inline"]
 if mute_inline == "no" then
if not lang then
return "âک†م€‹*Mد…ر‚ر” Iخ·â„“خ¹خ·ر”* _Iر• Aâ„“رڈر”خ±âˆ‚رƒ Dخ¹ر•خ±ذ²â„“ر”âˆ‚_ًں”ٹ\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
elseif lang then
return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ع©غŒط¨ظˆط±ط¯ ط´غŒط´ظ‡ ط§غŒ ظپط¹ط§ظ„ ظ†غŒط³طھًں”ٹ\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else 
data[tostring(target)]["settings"]["mute_inline"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "âک†م€‹*Mد…ر‚ر” Iخ·â„“خ¹خ·ر”* _Hخ±ر• Bر”ر”خ· Dخ¹ر•خ±ذ²â„“ر”âˆ‚_ًں”ٹ\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
else
return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ع©غŒط¨ظˆط±ط¯ ط´غŒط´ظ‡ ط§غŒ  ط؛غŒط± ظپط¹ط§ظ„ ط´ط¯ًں”ٹ\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end
---------------Mute Text-------------------
local function mute_text(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
 return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end

local mute_text = data[tostring(target)]["settings"]["mute_text"] 
if mute_text == "yes" then
if not lang then
 return "âک†م€‹*Mد…ر‚ر” Tر”د‡ر‚* _Iر• Aâ„“رڈر”خ±âˆ‚رƒ Eخ·خ±ذ²â„“ر”âˆ‚_ًں”‡\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
elseif lang then
 return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ظ…طھظ†  ط§ط² ظ‚ط¨ظ„ ظپط¹ط§ظ„ ط§ط³طھًں”‡\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else
 data[tostring(target)]["settings"]["mute_text"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "âک†م€‹*Mد…ر‚ر” Tر”د‡ر‚* _Hخ±ر• Bر”ر”خ· Eخ·خ±ذ²â„“ر”âˆ‚_ًں”‡\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
else
 return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ظ…طھظ† ظپط¹ط§ظ„ ط´ط¯ًں”‡\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end

local function unmute_text(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end 
end

local mute_text = data[tostring(target)]["settings"]["mute_text"]
 if mute_text == "no" then
if not lang then
return "âک†م€‹*Mد…ر‚ر” Tر”د‡ر‚* _Iر• Aâ„“رڈر”خ±âˆ‚رƒ Dخ¹ر•خ±ذ²â„“ر”âˆ‚_ًں”ٹ\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
elseif lang then
return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† # ظ…طھظ† ظپط¹ط§ظ„ ظ†غŒط³طھًں”ٹ\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
end
else 
data[tostring(target)]["settings"]["mute_text"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "âک†م€‹*Mد…ر‚ر” Tر”د‡ر‚* _Hخ±ر• Bر”ر”خ· Dخ¹ر•خ±ذ²â„“ر”âˆ‚_ًں”ٹ\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
else
return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† # ظ…طھظ† ط؛غŒط± ظپط¹ط§ظ„ ط´ط¯ًں”ٹ\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end
---------------Mute photo-------------------
local function mute_photo(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
 return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end

local mute_photo = data[tostring(target)]["settings"]["mute_photo"] 
if mute_photo == "yes" then
if not lang then
 return "âک†م€‹*Mد…ر‚ر” Pذ½دƒر‚دƒ* _Iر• Aâ„“رڈر”خ±âˆ‚رƒ Eخ·خ±ذ²â„“ر”âˆ‚_ًں”‡\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
elseif lang then
 return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ط¹ع©ط³  ط§ط² ظ‚ط¨ظ„ ظپط¹ط§ظ„ ط§ط³طھًں”‡\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else
 data[tostring(target)]["settings"]["mute_photo"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "âک†م€‹*Mد…ر‚ر” Pذ½دƒر‚دƒ* _Hخ±ر• Bر”ر”خ· Eخ·خ±ذ²â„“ر”âˆ‚_ًں”‡\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
else
 return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ط¹ع©ط³ ظپط¹ط§ظ„ ط´ط¯ًں”‡\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end

local function unmute_photo(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end
 
local mute_photo = data[tostring(target)]["settings"]["mute_photo"]
 if mute_photo == "no" then
if not lang then
return "âک†م€‹*Mد…ر‚ر” Pذ½دƒر‚دƒ* _Iر• Aâ„“رڈر”خ±âˆ‚رƒ Dخ¹ر•خ±ذ²â„“ر”âˆ‚_ًں”ٹ\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
elseif lang then
return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ط¹ع©ط³ ظپط¹ط§ظ„ ظ†غŒط³طھًں”ٹ\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else 
data[tostring(target)]["settings"]["mute_photo"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "âک†م€‹*Mد…ر‚ر” Pذ½دƒر‚دƒ* _Hخ±ر• Bر”ر”خ· Dخ¹ر•خ±ذ²â„“ر”âˆ‚_ًں”ٹ\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
else
return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† # ط¹ع©ط³ ط؛غŒط± ظپط¹ط§ظ„ ط´ط¯ًں”ٹ\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end
---------------Mute Video-------------------
local function mute_video(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
 return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end

local mute_video = data[tostring(target)]["settings"]["mute_video"] 
if mute_video == "yes" then
if not lang then
 return "âک†م€‹*Mد…ر‚ر” Vخ¹âˆ‚ر”دƒ* _Iر• Aâ„“رڈر”خ±âˆ‚رƒ Eخ·خ±ذ²â„“ر”âˆ‚_ًں”‡\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
elseif lang then
 return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ظˆغŒط¯غŒظˆ  ط§ط² ظ‚ط¨ظ„ ظپط¹ط§ظ„ ط§ط³طھًں”‡\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else
 data[tostring(target)]["settings"]["mute_video"] = "yes" 
save_data(_config.moderation.data, data)
if not lang then 
 return "âک†م€‹*Mد…ر‚ر” Vخ¹âˆ‚ر”دƒ* _Hخ±ر• Bر”ر”خ· Eخ·خ±ذ²â„“ر”âˆ‚_ًں”‡\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
else
 return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ظˆغŒط¯غŒظˆ ظپط¹ط§ظ„ ط´ط¯ًں”‡\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end

local function unmute_video(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end 

local mute_video = data[tostring(target)]["settings"]["mute_video"]
 if mute_video == "no" then
if not lang then
return "âک†م€‹*Mد…ر‚ر” Vخ¹âˆ‚ر”دƒ* _Iر• Aâ„“رڈر”خ±âˆ‚رƒ Dخ¹ر•خ±ذ²â„“ر”âˆ‚_ًں”ٹ\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
elseif lang then
return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ظˆغŒط¯غŒظˆ ظپط¹ط§ظ„ ظ†غŒط³طھًں”ٹ\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else 
data[tostring(target)]["settings"]["mute_video"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "âک†م€‹*Mد…ر‚ر” Vخ¹âˆ‚ر”دƒ* _Hخ±ر• Bر”ر”خ· Dخ¹ر•خ±ذ²â„“ر”âˆ‚_ًں”ٹ\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
else
return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ظˆغŒط¯غŒظˆ ط؛غŒط± ظپط¹ط§ظ„ ط´ط¯ًں”ٹ\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end
---------------Mute Audio-------------------
local function mute_audio(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
 return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end

local mute_audio = data[tostring(target)]["settings"]["mute_audio"] 
if mute_audio == "yes" then
if not lang then
 return "âک†م€‹*Mد…ر‚ر” Aد…âˆ‚خ¹دƒ* _Iر• Aâ„“رڈر”خ±âˆ‚رƒ Eخ·خ±ذ²â„“ر”âˆ‚_ًں”‡\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
elseif lang then
 return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ط§ظ‡ظ†ع¯  ط§ط² ظ‚ط¨ظ„ ظپط¹ط§ظ„ ط§ط³طھًں”‡\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else
 data[tostring(target)]["settings"]["mute_audio"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "âک†م€‹*Mد…ر‚ر” Aد…âˆ‚خ¹دƒ* _Hخ±ر• Bر”ر”خ· Eخ·خ±ذ²â„“ر”âˆ‚_ًں”‡\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
else 
return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ط§ظ‡ظ†ع¯ ظپط¹ط§ظ„ ط´ط¯ًں”‡\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end

local function unmute_audio(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end 

local mute_audio = data[tostring(target)]["settings"]["mute_audio"]
 if mute_audio == "no" then
if not lang then
return "âک†م€‹*Mد…ر‚ر” Aد…âˆ‚خ¹دƒ* _Iر• Aâ„“رڈر”خ±âˆ‚رƒ Dخ¹ر•خ±ذ²â„“ر”âˆ‚_ًں”ٹ\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
elseif lang then
return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ط§ظ‡ظ†ع¯ ظپط¹ط§ظ„ ظ†غŒط³طھًں”ٹ\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else 
data[tostring(target)]["settings"]["mute_audio"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
return "âک†م€‹*Mد…ر‚ر” Aد…âˆ‚خ¹دƒ* _Hخ±ر• Bر”ر”خ· Dخ¹ر•خ±ذ²â„“ر”âˆ‚_ًں”ٹ\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
else
return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ط§ظ‡ظ†ع¯ ط؛غŒط± ظپط¹ط§ظ„ ط´ط¯ًں”ٹ\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
end
end
end
---------------Mute Voice-------------------
local function mute_voice(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
 return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end

local mute_voice = data[tostring(target)]["settings"]["mute_voice"] 
if mute_voice == "yes" then
if not lang then
 return "âک†م€‹*Mد…ر‚ر” Vدƒخ¹cر”* _Iر• Aâ„“رڈر”خ±âˆ‚رƒ Eخ·خ±ذ²â„“ر”âˆ‚_ًں”‡\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
elseif lang then
 return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #طµط¯ط§ (ظˆظˆغŒط³)  ط§ط² ظ‚ط¨ظ„ ظپط¹ط§ظ„ ط§ط³طھًں”‡\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else
 data[tostring(target)]["settings"]["mute_voice"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "âک†م€‹*Mد…ر‚ر” Vدƒخ¹cر”* _Hخ±ر• Bر”ر”خ· Eخ·خ±ذ²â„“ر”âˆ‚_ًں”‡\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
else
 return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #طµط¯ط§ (ظˆظˆغŒط³)  ظپط¹ط§ظ„ ط´ط¯ًں”‡\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end

local function unmute_voice(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end 

local mute_voice = data[tostring(target)]["settings"]["mute_voice"]
 if mute_voice == "no" then
if not lang then
return "âک†م€‹*Mد…ر‚ر” Vدƒخ¹cر”* _Iر• Aâ„“رڈر”خ±âˆ‚رƒ Dخ¹ر•خ±ذ²â„“ر”âˆ‚_ًں”ٹ\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
elseif lang then
return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #طµط¯ط§ (ظˆظˆغŒط³) ظپط¹ط§ظ„ ظ†غŒط³طھًں”ٹ\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else 
data[tostring(target)]["settings"]["mute_voice"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
return "âک†م€‹*Mد…ر‚ر” Vدƒخ¹cر”* _Hخ±ر• Bر”ر”خ· Dخ¹ر•خ±ذ²â„“ر”âˆ‚_ًں”ٹ\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
else
return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #طµط¯ط§ (ظˆظˆغŒط³) ط؛غŒط± ظپط¹ط§ظ„ ط´ط¯ًں”ٹ\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end
---------------Mute Sticker-------------------
local function mute_sticker(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
 return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end

local mute_sticker = data[tostring(target)]["settings"]["mute_sticker"] 
if mute_sticker == "yes" then
if not lang then
 return "âک†م€‹*Mد…ر‚ر” Sر‚خ¹cذ؛ر”رڈ* _Iر• Aâ„“رڈر”خ±âˆ‚رƒ Eخ·خ±ذ²â„“ر”âˆ‚_ًں”‡\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
elseif lang then
 return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ط§ط³طھغŒع©ط±  ط§ط² ظ‚ط¨ظ„ ظپط¹ط§ظ„ ط§ط³طھًں”‡\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else
 data[tostring(target)]["settings"]["mute_sticker"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "âک†م€‹*Mد…ر‚ر” Sر‚خ¹cذ؛ر”رڈ* _Hخ±ر• Bر”ر”خ· Eخ·خ±ذ²â„“ر”âˆ‚_ًں”‡\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
else
 return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ط§ط³طھغŒع©ط± ظپط¹ط§ظ„ ط´ط¯ًں”‡\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end

local function unmute_sticker(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end 
end

local mute_sticker = data[tostring(target)]["settings"]["mute_sticker"]
 if mute_sticker == "no" then
if not lang then
return "âک†م€‹*Mد…ر‚ر” Sر‚خ¹cذ؛ر”رڈ* _Iر• Aâ„“رڈر”خ±âˆ‚رƒ Dخ¹ر•خ±ذ²â„“ر”âˆ‚_ًں”ٹ\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
elseif lang then
return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ط§ط³طھغŒع©ط± ظپط¹ط§ظ„ ظ†غŒط³طھًں”ٹ\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else 
data[tostring(target)]["settings"]["mute_sticker"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
return "âک†م€‹*Mد…ر‚ر” Sر‚خ¹cذ؛ر”رڈ* _Hخ±ر• Bر”ر”خ· Dخ¹ر•خ±ذ²â„“ر”âˆ‚_ًں”ٹ\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
else
return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ط§ط³طھغŒع©ط± ط؛غŒط± ظپط¹ط§ظ„ ط´ط¯ًں”ٹ\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end 
end
end
---------------Mute Contact-------------------
local function mute_contact(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
 return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end

local mute_contact = data[tostring(target)]["settings"]["mute_contact"] 
if mute_contact == "yes" then
if not lang then
 return "âک†م€‹*Mد…ر‚ر” Cدƒخ·ر‚خ±cر‚* _Iر• Aâ„“رڈر”خ±âˆ‚رƒ Eخ·خ±ذ²â„“ر”âˆ‚_ًں”‡\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
elseif lang then
 return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ط§ط±ط³ط§ظ„ ظ…ط®ط§ط·ط¨  ط§ط² ظ‚ط¨ظ„ ظپط¹ط§ظ„ ط§ط³طھًں”‡\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else
 data[tostring(target)]["settings"]["mute_contact"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "âک†م€‹*Mد…ر‚ر” Cدƒخ·ر‚خ±cر‚* _Hخ±ر• Bر”ر”خ· Eخ·خ±ذ²â„“ر”âˆ‚_ًں”‡\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
else
 return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ط§ط±ط³ط§ظ„ ظ…ط®ط§ط·ط¨ ظپط¹ط§ظ„ ط´ط¯ًں”‡\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end

local function unmute_contact(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end 

local mute_contact = data[tostring(target)]["settings"]["mute_contact"]
 if mute_contact == "no" then
if not lang then
return "âک†م€‹*Mد…ر‚ر” Cدƒخ·ر‚خ±cر‚* _Iر• Aâ„“رڈر”خ±âˆ‚رƒ Dخ¹ر•خ±ذ²â„“ر”âˆ‚_ًں”ٹ\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
elseif lang then
return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ط§ط±ط³ط§ظ„ ظ…ط®ط·ط¨ ظپط¹ط§ظ„ ظ†غŒط³طھًں”ٹ\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else 
data[tostring(target)]["settings"]["mute_contact"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "âک†م€‹*Mد…ر‚ر” Cدƒخ·ر‚خ±cر‚* _Hخ±ر• Bر”ر”خ· Dخ¹ر•خ±ذ²â„“ر”âˆ‚_ًں”ٹ\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
else
return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ط§ط±ط³ط§ظ„ ظ…ط®ط§ط·ط¨ ط؛غŒط± ظپط¹ط§ظ„ ط´ط¯ًں”ٹ\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end
---------------Mute Forward-------------------
local function mute_forward(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
 return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end

local mute_forward = data[tostring(target)]["settings"]["mute_forward"] 
if mute_forward == "yes" then
if not lang then
 return "âک†م€‹*Mد…ر‚ر” Fدƒرڈد‰خ±رڈâˆ‚* _Iر• Aâ„“رڈر”خ±âˆ‚رƒ Eخ·خ±ذ²â„“ر”âˆ‚_ًں”‡\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
elseif lang then
 return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ظپظˆط±ظˆط§ط±ط¯ ط§ط² ظ‚ط¨ظ„ ظپط¹ط§ظ„ ط§ط³طھًں”‡\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else
 data[tostring(target)]["settings"]["mute_forward"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "âک†م€‹*Mد…ر‚ر” Fدƒرڈد‰خ±رڈâˆ‚* _Hخ±ر• Bر”ر”خ· Eخ·خ±ذ²â„“ر”âˆ‚_ًں”‡\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
else
 return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ظپظˆط±ظˆط§ط±ط¯ ظپط¹ط§ظ„ ط´ط¯ًں”‡\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end

local function unmute_forward(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end 

local mute_forward = data[tostring(target)]["settings"]["mute_forward"]
 if mute_forward == "no" then
if not lang then
return "âک†م€‹*Mد…ر‚ر” Fدƒرڈد‰خ±رڈâˆ‚* _Iر• Aâ„“رڈر”خ±âˆ‚رƒ Dخ¹ر•خ±ذ²â„“ر”âˆ‚_ًں”ٹ\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
elseif lang then
return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ظپظˆط±ظˆط§ط±ط¯ ظپط¹ط§ظ„ ظ†غŒط³طھًں”ٹ\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end 
else 
data[tostring(target)]["settings"]["mute_forward"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
return "âک†م€‹*Mد…ر‚ر” Fدƒرڈد‰خ±رڈâˆ‚* _Hخ±ر• Bر”ر”خ· Dخ¹ر•خ±ذ²â„“ر”âˆ‚_ًں”ٹ\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
else
return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ظپظˆط±ظˆط§ط±ط¯ ط؛غŒط± ظپط¹ط§ظ„ ط´ط¯ًں”ٹ\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end
---------------Mute Location-------------------
local function mute_location(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
 return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end

local mute_location = data[tostring(target)]["settings"]["mute_location"] 
if mute_location == "yes" then
if not lang then
 return "âک†م€‹*Mد…ر‚ر” Lدƒcخ±ر‚خ¹دƒخ·* _Iر• Aâ„“رڈر”خ±âˆ‚رƒ Eخ·خ±ذ²â„“ر”âˆ‚_ًں”‡\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
elseif lang then
 return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ظ…ظˆظ‚ط¹غŒطھ  ط§ط² ظ‚ط¨ظ„ ظپط¹ط§ظ„ ط§ط³طھًں”‡\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else
 data[tostring(target)]["settings"]["mute_location"] = "yes" 
save_data(_config.moderation.data, data)
if not lang then
 return "âک†م€‹*Mد…ر‚ر” Lدƒcخ±ر‚خ¹دƒخ·* _Hخ±ر• Bر”ر”خ· Eخ·خ±ذ²â„“ر”âˆ‚_ًں”‡\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
else
 return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ظ…ظˆظ‚ط¹غŒطھ ظپط¹ط§ظ„ ط´ط¯ًں”‡\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end

local function unmute_location(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end 

local mute_location = data[tostring(target)]["settings"]["mute_location"]
 if mute_location == "no" then
if not lang then
return "âک†م€‹*Mد…ر‚ر” Lدƒcخ±ر‚خ¹دƒخ·* _Iر• Aâ„“رڈر”خ±âˆ‚رƒ Dخ¹ر•خ±ذ²â„“ر”âˆ‚_ًں”ٹ\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
elseif lang then
return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ظ…ظˆظ‚ط¹غŒطھ ظپط¹ط§ظ„ ظ†غŒط³طھًں”ٹ\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else 
data[tostring(target)]["settings"]["mute_location"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "âک†م€‹*Mد…ر‚ر” Lدƒcخ±ر‚خ¹دƒخ·* _Hخ±ر• Bر”ر”خ· Dخ¹ر•خ±ذ²â„“ر”âˆ‚_ًں”ٹ\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
else
return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ظ…ظˆظ‚ط¹غŒطھ ط؛غŒط± ظپط¹ط§ظ„ ط´ط¯ًں”ٹ\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end
---------------Mute Document-------------------
local function mute_document(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end

local mute_document = data[tostring(target)]["settings"]["mute_document"] 
if mute_document == "yes" then
if not lang then
 return "âک†م€‹*Mد…ر‚ر” Dدƒcد…ذ¼ر”خ·ر‚* _Iر• Aâ„“رڈر”خ±âˆ‚رƒ Eخ·خ±ذ²â„“ر”âˆ‚_ًں”‡\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
elseif lang then
 return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ط§ط³ظ†ط§ط¯  ط§ط² ظ‚ط¨ظ„ ظپط¹ط§ظ„ ط§ط³طھًں”‡\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else
 data[tostring(target)]["settings"]["mute_document"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "âک†م€‹*Mد…ر‚ر” Dدƒcد…ذ¼ر”خ·ر‚* _Hخ±ر• Bر”ر”خ· Eخ·خ±ذ²â„“ر”âˆ‚_ًں”‡\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
else
 return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ط§ط³ظ†ط§ط¯ ظپط¹ط§ظ„ ط´ط¯ًں”‡\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end

local function unmute_document(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end 

local mute_document = data[tostring(target)]["settings"]["mute_document"]
 if mute_document == "no" then
if not lang then
return "âک†م€‹*Mد…ر‚ر” Dدƒcد…ذ¼ر”خ·ر‚* _Iر• Aâ„“رڈر”خ±âˆ‚رƒ Dخ¹ر•خ±ذ²â„“ر”âˆ‚_ًں”ٹ\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
elseif lang then
return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ط§ط³ظ†ط§ط¯ ظپط¹ط§ظ„ ظ†غŒط³طھًں”ٹ\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else 
data[tostring(target)]["settings"]["mute_document"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "âک†م€‹*Mد…ر‚ر” Dدƒcد…ذ¼ر”خ·ر‚* _Hخ±ر• Bر”ر”خ· Dخ¹ر•خ±ذ²â„“ر”âˆ‚_ًں”ٹ\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»" 
else
return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ط§ط³ظ†ط§ط¯ ط؛غŒط± ظپط¹ط§ظ„ ط´ط¯ًں”ٹ\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end
---------------Mute TgService-------------------
local function mute_tgservice(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
 return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end

local mute_tgservice = data[tostring(target)]["settings"]["mute_tgservice"] 
if mute_tgservice == "yes" then
if not lang then
 return "âک†م€‹*Mد…ر‚ر” TgSر”رڈخ½خ¹cر”* _Iر• Aâ„“رڈر”خ±âˆ‚رƒ Eخ·خ±ذ²â„“ر”âˆ‚_ًں”‡\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
elseif lang then
 return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ط®ط¯ظ…ط§طھ طھظ„ع¯ط±ط§ظ… ط§ط² ظ‚ط¨ظ„ ظپط¹ط§ظ„ ط§ط³طھًں”‡\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else
 data[tostring(target)]["settings"]["mute_tgservice"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "âک†م€‹*Mد…ر‚ر” TgSر”رڈخ½خ¹cر”* _Hخ±ر• Bر”ر”خ· Eخ·خ±ذ²â„“ر”âˆ‚_ًں”‡\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
else
return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ط®ط¯ظ…ط§طھ طھظ„ع¯ط±ط§ظ…  ظپط¹ط§ظ„ ط´ط¯ًں”‡\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end

local function unmute_tgservice(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end 
end

local mute_tgservice = data[tostring(target)]["settings"]["mute_tgservice"]
 if mute_tgservice == "no" then
if not lang then
return "âک†م€‹*Mد…ر‚ر” TgSر”رڈخ½خ¹cر”* _Iر• Aâ„“رڈر”خ±âˆ‚رƒ Dخ¹ر•خ±ذ²â„“ر”âˆ‚_ًں”ٹ\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
elseif lang then
return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ط®ط¯ظ…ط§طھ طھظ„ع¯ط±ط§ظ… ظپط¹ط§ظ„ ظ†غŒط³طھًں”ٹ\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end 
else 
data[tostring(target)]["settings"]["mute_tgservice"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "âک†م€‹*Mد…ر‚ر” TgSر”رڈخ½خ¹cر”* _Hخ±ر• Bر”ر”خ· Dخ¹ر•خ±ذ²â„“ر”âˆ‚_ًں”ٹ\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
else
return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† #ط®ط¯ظ…ط§طھ طھظ„ع¯ط±ط§ظ…  ط؛غŒط±ظپط¹ط§ظ„ ط´ط¯ًں”ٹ\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end 
end
end

---------------Mute Keyboard-------------------
local function mute_keyboard(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
 return "ط´ظ…ط§ ظ…ط¯غŒط± ع¯ط±ظˆظ‡ ظ†ظ…غŒط¨ط§ط´غŒط¯"
end
end

local mute_keyboard = data[tostring(target)]["settings"]["mute_keyboard"] 
if mute_keyboard == "yes" then
if not lang then
 return "âک†م€‹*Mد…ر‚ر” Kر”رƒذ²دƒخ±رڈâˆ‚* _Iر• Aâ„“رڈر”خ±âˆ‚رƒ Eخ·خ±ذ²â„“ر”âˆ‚_ًں”‡\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
elseif lang then
 return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† طµظپط­ظ‡ ع©ظ„غŒط¯ ظپط¹ط§ظ„ ط§ط³طھًں”‡\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
else
 data[tostring(target)]["settings"]["mute_keyboard"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "âک†م€‹*Mد…ر‚ر” Kر”رƒذ²دƒخ±رڈâˆ‚* _Hخ±ر• Bر”ر”خ· Eخ·خ±ذ²â„“ر”âˆ‚_ًں”‡\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
else
return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† طµظپط­ظ‡ ع©ظ„غŒط¯ ظپط¹ط§ظ„ ط´ط¯ًں”‡\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end
end
end

local function unmute_keyboard(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·"
else
return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end 
end

local mute_keyboard = data[tostring(target)]["settings"]["mute_keyboard"]
 if mute_keyboard == "no" then
if not lang then
return "âک†م€‹*Mد…ر‚ر” Kر”رƒذ²دƒخ±رڈâˆ‚* _Iر• Aâ„“رڈر”خ±âˆ‚رƒ Dخ¹ر•خ±ذ²â„“ر”âˆ‚_ًں”ٹ\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
elseif lang then
return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† طµظپط­ظ‡ ع©ظ„غŒط¯ ط؛غŒط±ظپط¹ط§ظ„ ط§ط³طھًں”ٹ\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end 
else 
data[tostring(target)]["settings"]["mute_keyboard"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "âک†م€‹*Mد…ر‚ر” TgSر”رڈخ½خ¹cر”* _Hخ±ر• Bر”ر”خ· Dخ¹ر•خ±ذ²â„“ر”âˆ‚_ًں”ٹ\n*_________________*\n*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
else
return "âک†م€‹ط¨غŒطµط¯ط§ ع©ط±ط¯ظ† طµظپط­ظ‡ ع©ظ„غŒط¯ ط؛غŒط±ظپط¹ط§ظ„ ط´ط¯ًں”ٹ\n*_________________*\n*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»"
end 
end
end
----------Settings---------
local function group_settings(msg, target) 	
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "â™¯م€‹*Yدƒد… خ±رڈر” خ·دƒر‚ ذ²دƒر‚ خ±âˆ‚ذ¼خ¹خ·*ًںڑ·" 
else
 return "#م€‹_ط´ظ…ط§ ظ…ط¯غŒط± ط±ط¨ط§طھ ظ†غŒط³طھغŒط¯_ًںڑ·"
end
end
local data = load_data(_config.moderation.data)
local target = msg.to.id 
if data[tostring(target)] then 	
if data[tostring(target)]["settings"]["num_msg_max"] then 	
NUM_MSG_MAX = tonumber(data[tostring(target)]['settings']['num_msg_max'])
	print('custom'..NUM_MSG_MAX) 	
else 	
NUM_MSG_MAX = 5
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_link"] then			
data[tostring(target)]["settings"]["lock_link"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_tag"] then			
data[tostring(target)]["settings"]["lock_tag"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["emoji"] then			
data[tostring(target)]["settings"]["emoji"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_mention"] then			
data[tostring(target)]["settings"]["lock_mention"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_arabic"] then			
data[tostring(target)]["settings"]["lock_arabic"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_edit"] then			
data[tostring(target)]["settings"]["lock_edit"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_spam"] then			
data[tostring(target)]["settings"]["lock_spam"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_flood"] then			
data[tostring(target)]["settings"]["lock_flood"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_bots"] then			
data[tostring(target)]["settings"]["lock_bots"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["english"] then			
data[tostring(target)]["settings"]["english"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["views"] then			
data[tostring(target)]["settings"]["views"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_markdown"] then			
data[tostring(target)]["settings"]["lock_markdown"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["ads"] then			
data[tostring(target)]["settings"]["ads"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["fosh"] then			
data[tostring(target)]["settings"]["fosh"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_webpage"] then			
data[tostring(target)]["settings"]["lock_webpage"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["welcome"] then			
data[tostring(target)]["settings"]["welcome"] = "no"		
end
end

 if data[tostring(target)]["settings"] then		
 if not data[tostring(target)]["settings"]["lock_pin"] then			
 data[tostring(target)]["settings"]["lock_pin"] = "no"		
 end
 end
 
  if data[tostring(target)]["settings"] then		
 if not data[tostring(target)]["settings"]["lock_tabchi"] then			
 data[tostring(target)]["settings"]["lock_tabchi"] = "no"		
 end
 end
 
local data = load_data(_config.moderation.data)
local target = msg.to.id
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_all"] then			
data[tostring(target)]["settings"]["mute_all"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_gif"] then			
data[tostring(target)]["settings"]["mute_gif"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_text"] then			
data[tostring(target)]["settings"]["mute_text"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_photo"] then			
data[tostring(target)]["settings"]["mute_photo"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_video"] then			
data[tostring(target)]["settings"]["mute_video"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_audio"] then			
data[tostring(target)]["settings"]["mute_audio"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_voice"] then			
data[tostring(target)]["settings"]["mute_voice"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_sticker"] then			
data[tostring(target)]["settings"]["mute_sticker"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_contact"] then			
data[tostring(target)]["settings"]["mute_contact"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_forward"] then			
data[tostring(target)]["settings"]["mute_forward"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_location"] then			
data[tostring(target)]["settings"]["mute_location"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_document"] then			
data[tostring(target)]["settings"]["mute_document"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_tgservice"] then			
data[tostring(target)]["settings"]["mute_tgservice"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_inline"] then			
data[tostring(target)]["settings"]["mute_inline"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_game"] then			
data[tostring(target)]["settings"]["mute_game"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_keyboard"] then			
data[tostring(target)]["settings"]["mute_keyboard"] = "no"		
end
end
 local expire_date = ''
local expi = redis:ttl('ExpireDate:'..msg.to.id)
if expi == -1 then
if lang then
	expire_date = 'ظ†ط§ظ…ط­ط¯ظˆط¯!'
else
	expire_date = 'Unlimited!'
end
else
	local day = math.floor(expi / 86400) + 1
if lang then
	expire_date = day..' ط±ظˆط²'
else
	expire_date = day..' Days'
end
end
if not lang then
local settings = data[tostring(target)]["settings"] 
 text ="*âڑ™gرڈدƒد…دپ ر•ر”ر‚ر‚خ¹خ·gر•:*\nم€‹*â„“دƒcذ؛ ر”âˆ‚خ¹ر‚ :* "..settings.lock_edit.."\nم€‹*â„“دƒcذ؛ â„“خ¹خ·ذ؛ر• :* "..settings.lock_link.."\nم€‹*â„“دƒcذ؛ ر‚خ±gر• :* "..settings.lock_tag.."\nم€‹*â„“دƒcذ؛ ئ’â„“دƒدƒâˆ‚ :* "..settings.flood.."\nم€‹*â„“دƒcذ؛ ر•دپخ±ذ¼ :* "..settings.lock_spam.."\nم€‹*â„“دƒcذ؛ ذ¼ر”خ·ر‚خ¹دƒخ· :* "..settings.lock_mention.."\nم€‹*â„“دƒcذ؛ خ±رڈخ±ذ²خ¹c :* "..settings.lock_arabic.."\nم€‹*â„“دƒcذ؛ د‰ر”ذ²دپخ±gر” :* "..settings.lock_webpage.."\nم€‹*â„“دƒcذ؛ ذ¼خ±رڈذ؛âˆ‚دƒد‰خ· :* "..settings.lock_markdown.."\nم€‹*â„“دƒcذ؛ ر”خ·gâ„“خ¹ر•ذ½ :* "..settings.english.."\nم€‹*â„“دƒcذ؛ ئ’دƒر•ذ½ :* "..settings.fosh.."\nم€‹*â„“دƒcذ؛ خ±âˆ‚ر• :* "..settings.ads.."\nم€‹*â„“دƒcذ؛ خ½خ¹ر”د‰ر• :* "..settings.views.."\nم€‹*â„“دƒcذ؛ ر”ذ¼دƒ× خ¹ :* "..settings.emoji.."\nم€‹*gرڈدƒد…دپ د‰ر”â„“cدƒذ¼ر” :* "..settings.welcome.."\nم€‹*â„“دƒcذ؛ دپخ¹خ· ذ¼ر”ر•ر•خ±gر” :* "..settings.lock_pin.."\nم€‹*â„“دƒcذ؛ tabchi :* "..settings.lock_tabchi.."\nم€‹*ذ²دƒر‚ر• دپرڈدƒر‚ر”cر‚خ¹دƒخ· :* "..settings.lock_bots.."\n*م€‹ئ’â„“دƒدƒâˆ‚ ر•ر”خ·ر•خ¹ر‚خ¹خ½خ¹ر‚رƒ:* *"..NUM_MSG_MAX.."*\n*____________________*\n*âڑ™gرڈدƒد…دپ ذ¼د…ر‚ر” â„“خ¹ر•ر‚* :\nم€‹*ذ¼د…ر‚ر” خ±â„“â„“ : * "..settings.mute_all.."\nم€‹*ذ¼د…ر‚ر” gخ¹ئ’ :* "..settings.mute_gif.."\nم€‹*ذ¼د…ر‚ر” ر‚ر”د‡ر‚ :* "..settings.mute_text.."\nم€‹*ذ¼د…ر‚ر” خ¹خ·â„“خ¹خ·ر” :* "..settings.mute_inline.."\nم€‹*ذ¼د…ر‚ر” gخ±ذ¼ر” :* "..settings.mute_game.."\nم€‹*ذ¼د…ر‚ر” دپذ½دƒر‚دƒ :* "..settings.mute_photo.."\nم€‹*ذ¼د…ر‚ر” خ½خ¹âˆ‚ر”دƒ :* "..settings.mute_video.."\nم€‹*ذ¼د…ر‚ر” خ±د…âˆ‚خ¹دƒ :* "..settings.mute_audio.."\nم€‹*ذ¼د…ر‚ر” خ½دƒخ¹cر” :* "..settings.mute_voice.."\nم€‹*ذ¼د…ر‚ر” ر•ر‚خ¹cذ؛ر”رڈ :* "..settings.mute_sticker.."\nم€‹*ذ¼د…ر‚ر” cدƒخ·ر‚خ±cر‚ :* "..settings.mute_contact.."\nم€‹*ذ¼د…ر‚ر” ئ’دƒرڈد‰خ±رڈâˆ‚ :* "..settings.mute_forward.."\nم€‹*ذ¼د…ر‚ر” â„“دƒcخ±ر‚خ¹دƒخ· :* "..settings.mute_location.."\nم€‹*ذ¼د…ر‚ر” âˆ‚دƒcد…ذ¼ر”خ·ر‚ :* "..settings.mute_document.."\nم€‹*ذ¼د…ر‚ر” ر‚gر•ر”رڈخ½خ¹cر” :* "..settings.mute_tgservice.."\nم€‹*ذ¼د…ر‚ر” ذ؛ر”رƒذ²دƒخ±رڈâˆ‚ :* "..settings.mute_keyboard.."\n*____________________*\n*ًںŒگgرڈدƒد…دپ â„“خ±خ·gد…خ±gر”* : ر”خ·\nًں—“*ر”د‡دپخ¹رڈ:* _"..expire_date.."_\n*âœ’ر•د…âˆ‚دƒ ذ²دƒر‚:*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»\n*Channel:*https://t.me/ninjateam20"
else
local exp = redis:get("charged:"..msg.chat_id_)
    local day = 86400
    local ex = redis:ttl("charged:"..msg.chat_id_)
       if not exp or ex == -1 then
        expirefa = " ظ†ط§ظ…ط­ط¯ظˆط¯"
       else
        local d = math.floor(ex / day ) + 1
       expirefa = " *"..d.."* _ط±ظˆط²_"
   end
local settings = data[tostring(target)]["settings"] 
 text = "*طھظ†ط¸غŒظ…ط§طھ ع¯ط±ظˆظ‡:*\n*>ظ‚ظپظ„ ظˆغŒط±ط§غŒط´ ظ¾غŒط§ظ… :* "..settings.lock_edit.."\n*>ظ‚ظپظ„ ظ„غŒظ†ع© :* "..settings.lock_link.."\n*>ظ‚ظپظ„ طھع¯ :* "..settings.lock_tag.."\n*>ظ‚ظپظ„ ظ¾غŒط§ظ… ظ…ع©ط±ط± :* "..settings.flood.."\n*>ظ‚ظپظ„ ظ‡ط±ط²ظ†ط§ظ…ظ‡ :* "..settings.lock_spam.."\n*>ظ‚ظپظ„ ظپط±ط§ط®ظˆط§ظ†غŒ :* "..settings.lock_mention.."\n*>ظ‚ظپظ„ ط¹ط±ط¨غŒ :* "..settings.lock_arabic.."\n*>ظ‚ظپظ„ طµظپط­ط§طھ ظˆط¨ :* "..settings.lock_webpage.."\n*>ظ‚ظپظ„ ظپظˆظ†طھ :* "..settings.lock_markdown.."\n*>ظ‚ظپظ„ ط§ظ†ع¯ظ„غŒط³غŒ :* "..settings.english.."\n*>ظ‚ظپظ„ ظپط­ط´: * "..settings.fosh.."\n*>ظ‚ظپظ„ طھط¨ظ„غŒظپط§طھ:* "..settings.ads.."\n*>ظ‚ظپظ„ ظ¾ط³طھ ظˆغŒظˆط¯ط§ط±:* "..settings.views.."\n*>ظ‚ظپظ„ ط§ظ…ظˆط¬غŒ:* "..settings.emoji.."\n*>ظ¾غŒط§ظ… ط®ظˆط´ط¢ظ…ط¯ ع¯ظˆغŒغŒ :* "..settings.welcome.."\n*>ظ‚ظپظ„ ط³ظ†ط¬ط§ظ‚ ع©ط±ط¯ظ† :* "..settings.lock_pin.."\n*>ظ‚ظپظ„ ط§ظˆط±ط¯ظ† طھط¨ع†غŒ :* "..settings.lock_tabchi.."\n*>ظ…ط­ط§ظپط¸طھ ط¯ط± ط¨ط±ط§ط¨ط± ط±ط¨ط§طھ ظ‡ط§ :* "..settings.lock_bots.."\n*>ط­ط¯ط§ع©ط«ط± ظ¾غŒط§ظ… ظ…ع©ط±ط± :* *"..NUM_MSG_MAX.."*\n*____________________*\n*ظ„غŒط³طھ ط¨غŒطµط¯ط§ ظ‡ط§* : \n*>ط¨غŒطµط¯ط§ ظ‡ظ…ظ‡ : * "..settings.mute_all.."\n*>ط¨غŒطµط¯ط§ طھطµط§ظˆغŒط± ظ…طھط­ط±ع© :* "..settings.mute_gif.."\n*>ط¨غŒطµط¯ط§ ظ…طھظ† :* "..settings.mute_text.."\n*>ط¨غŒطµط¯ط§ ع©غŒط¨ظˆط±ط¯ ط´غŒط´ظ‡ ط§غŒ :* "..settings.mute_inline.."\n*>ط¨غŒطµط¯ط§ ط¨ط§ط²غŒ ظ‡ط§غŒ طھط­طھ ظˆط¨ :* "..settings.mute_game.."\n*>ط¨غŒطµط¯ط§ ط¹ع©ط³ :* "..settings.mute_photo.."\n*>ط¨غŒطµط¯ط§ ظپغŒظ„ظ… :* "..settings.mute_video.."\n*>ط¨غŒطµط¯ط§ ط¢ظ‡ظ†ع¯ :* "..settings.mute_audio.."\n*>ط¨غŒطµط¯ط§ طµط¯ط§ :* "..settings.mute_voice.."\n*>ط¨غŒطµط¯ط§ ط¨ط±ع†ط³ط¨ :* "..settings.mute_sticker.."\n*>ط¨غŒطµط¯ط§ ظ…ط®ط§ط·ط¨ :* "..settings.mute_contact.."\n*>ط¨غŒطµط¯ط§ ظ†ظ‚ظ„ ظ‚ظˆظ„ :* "..settings.mute_forward.."\n*>ط¨غŒطµط¯ط§ ظ…ظˆظ‚ط¹غŒطھ :* "..settings.mute_location.."\n*>ط¨غŒطµط¯ط§ ط§ط³ظ†ط§ط¯ :* "..settings.mute_document.."\n*>ط¨غŒطµط¯ط§ ط®ط¯ظ…ط§طھ طھظ„ع¯ط±ط§ظ… :* "..settings.mute_tgservice.."\n*>ط¨غŒطµط¯ط§ طµظپط­ظ‡ ع©ظ„غŒط¯ :* "..settings.mute_keyboard.."\n*____________________*\nًںŒگ_ط²ط¨ط§ظ† ط³ظˆظ¾ط±ع¯ط±ظˆظ‡_ : *ظپط§ط±ط³غŒ*\nًں—“*طھط§ط±غŒط® ط§ظ†ظ‚ط¶ط§ ع¯ط±ظˆظ‡: * _"..expire_date.."_\nâœ’*ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³:*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»\n*Channel:* https://t.me/ninjateam20"
end
if not lang then
text = string.gsub(text, "yes", "#لƒ§خµà¸£ âœ”")
text = string.gsub(text, "no", "#خ·دƒ âœ–")
text =  string.gsub(text, "0", "â“ھ")
text =  string.gsub(text, "1", "â‍€")
text =  string.gsub(text, "2", "â‍پ")
text =  string.gsub(text, "3", "â‍‚")
text =  string.gsub(text, "4", "â‍ƒ")
text =  string.gsub(text, "5", "â‍„")
text =  string.gsub(text, "6", "â‍…")
text =  string.gsub(text, "7", "â‍†")
text =  string.gsub(text, "8", "â‍‡")
text =  string.gsub(text, "9", "â‍ˆ")
 else
 text = string.gsub(text, "yes", "#ظپط¹ط§ظ„ âœ”")
 text =  string.gsub(text, "no", "#ط؛غŒط±ظپط¹ط§ظ„ âœ–")
 end

return text
end

local function run(msg, matches)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local data = load_data(_config.moderation.data)
local chat = msg.to.id
local user = msg.from.id
if msg.to.type ~= 'pv' then
if matches[1] == "id" or matches[1]=="ط¢غŒط¯غŒ" or matches[1]=="Id" or matches[1]=="ط§غŒط¯غŒ"then
if not matches[2] and not msg.reply_id then
local function getpro(arg, data)
 if data.photos_[0] then
       if not lang then
            tdcli.sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, data.photos_[0].sizes_[1].photo_.persistent_id_,'Chat ID : '..msg.to.id..'\nUser ID : '..msg.from.id,dl_cb,nil)
       elseif lang then
          tdcli.sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, data.photos_[0].sizes_[1].photo_.persistent_id_,'ط´ظ†ط§ط³ظ‡ ع¯ط±ظˆظ‡ : '..msg.to.id..'\nط´ظ†ط§ط³ظ‡ ط´ظ…ط§ : '..msg.from.id,dl_cb,nil)
     end
   else
       if not lang then
      tdcli.sendMessage(msg.to.id, msg.id_, 1, "`You Have Not Profile Photo...!`\n\n> *Chat ID :* `"..msg.to.id.."`\n*User ID :* `"..msg.from.id.."`", 1, 'md')
       elseif lang then
      tdcli.sendMessage(msg.to.id, msg.id_, 1, "_ط´ظ…ط§ ظ‡غŒع† ط¹ع©ط³غŒ ظ†ط¯ط§ط±غŒط¯...!_\n\n> _ط´ظ†ط§ط³ظ‡ ع¯ط±ظˆظ‡ :_ `"..msg.to.id.."`\n_ط´ظ†ط§ط³ظ‡ ط´ظ…ط§ :_ `"..msg.from.id.."`", 1, 'md')
            end
        end
end
	   tdcli_function ({
    ID = "GetUserProfilePhotos",
    user_id_ = msg.from.id,
    offset_ = 0,
    limit_ = 1
  }, getpro, nil)	
end
if msg.reply_id and not matches[2] then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="id"})
  end
if matches[2] then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="id"})
      end
   end
if matches[1] == "pin" and is_mod(msg) and msg.reply_id  or matches[1] == "ط³ظ†ط¬ط§ظ‚" and is_mod(msg) and msg.reply_id or matches[1] == "Pin" and is_mod(msg) and msg.reply_id then
local lock_pin = data[tostring(msg.to.id)]["settings"]["lock_pin"] 
 if lock_pin == 'yes' then
if is_owner(msg) then
    data[tostring(chat)]['pin'] = msg.reply_id
	  save_data(_config.moderation.data, data)
tdcli.pinChannelMessage(msg.to.id, msg.reply_id, 1)
if not lang then
return "*Mر”ر•ر•خ±gر” Hخ±ر• Bر”ر”خ· Pخ¹خ·خ·ر”âˆ‚*"
elseif lang then
return "_ظ¾غŒط§ظ… ط³ط¬ط§ظ‚ ط´ط¯_âœ…"
end
elseif not is_owner(msg) then
   return
 end
 elseif lock_pin == 'no' then
    data[tostring(chat)]['pin'] = msg.reply_id
	  save_data(_config.moderation.data, data)
tdcli.pinChannelMessage(msg.to.id, msg.reply_id, 1)
if not lang then
return "*Mر”ر•ر•خ±gر” Hخ±ر• Bر”ر”خ· Pخ¹خ·خ·ر”âˆ‚*"
elseif lang then
return "_ظ¾غŒط§ظ… ط³ط¬ط§ظ‚ ط´ط¯_âœ…"
end
end
end
if matches[1] == 'unpin' and is_mod(msg) or matches[1] == 'ط¨ط±ط¯ط§ط´طھظ† ط³ظ†ط¬ط§ظ‚' and is_mod(msg) or matches[1] == 'Unpin' and is_mod(msg) then
local lock_pin = data[tostring(msg.to.id)]["settings"]["lock_pin"] 
 if lock_pin == 'yes' then
if is_owner(msg) then
tdcli.unpinChannelMessage(msg.to.id)
if not lang then
return "*Pخ¹خ· ذ¼ر”ر•ر•خ±gر” ذ½خ±ر• ذ²ر”ر”خ· د…خ·دپخ¹خ·خ·ر”âˆ‚*"
elseif lang then
return "ظ¾غŒط§ظ… ط³ظ†ط¬ط§ظ‚ ط´ط¯ظ‡ ظ¾ط§ع© ط´ط¯âœ…"
end
elseif not is_owner(msg) then
   return 
 end
 elseif lock_pin == 'no' then
tdcli.unpinChannelMessage(msg.to.id)
if not lang then
return "*Pخ¹خ· ذ¼ر”ر•ر•خ±gر” ذ½خ±ر• ذ²ر”ر”خ· د…خ·دپخ¹خ·خ·ر”âˆ‚*"
elseif lang then
return "ظ¾غŒط§ظ… ط³ظ†ط¬ط§ظ‚ ط´ط¯ظ‡ ظ¾ط§ع© ط´ط¯âœ…"
end
end
end
if matches[1] == "add" or  matches[1] == "ظ†طµط¨" or matches[1] == "Add" then
return modadd(msg)
end
if matches[1] == "rem" or matches[1] == "ظ„ط؛ظˆ ظ†طµط¨" or matches[1] == "Rem" then
return modrem(msg)
end
if matches[1] == "setowner" and is_admin(msg) or  matches[1] == "طھظ†ط¸غŒظ… ظ…ط§ظ„ع©" and is_admin(msg) or matches[1] == "Setowner" and is_admin(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="setowner"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[2],cmd="setowner"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="setowner"})
      end
   end
if matches[1] == "remowner" and is_admin(msg) or matches[1] == "ط­ط°ظپ ظ…ط§ظ„ع©" and is_admin(msg) or matches[1] == "Remowner" and is_admin(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="remowner"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[2],cmd="remowner"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="remowner"})
      end
   end
if matches[1] == "promote" and is_owner(msg) or matches[1] == "طھط±ظپغŒط¹" and is_owner(msg) or matches[1] == "Promote" and is_owner(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="promote"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[2],cmd="promote"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="promote"})
      end
   end
if matches[1] == "demote" and is_owner(msg) or  matches[1] == "ط¹ط²ظ„" and is_owner(msg) or matches[1] == "Demote" and is_owner(msg) then
if not matches[2] and msg.reply_id then
 tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="demote"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[2],cmd="demote"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="demote"})
      end
   end

if matches[1] == "lock" and is_mod(msg) or  matches[1] == "ظ‚ظپظ„" and is_mod(msg) or matches[1] == "Lock" and is_mod(msg) then
local target = msg.to.id
if matches[2] == "link" or matches[2]=="ظ„غŒظ†ع©" then
return lock_link(msg, data, target)
end
if matches[2] == "tag"  or matches[2]=="طھع¯" then
return lock_tag(msg, data, target)
end
if matches[2] == "mention"  or matches[2]=="ظپط±ط§ط®ظˆط§ظ†غŒ" then
return lock_mention(msg, data, target)
end
if matches[2] == "arabic"  or matches[2]=="ط¹ط±ط¨غŒ" then
return lock_arabic(msg, data, target)
end
if matches[2] == "edit"  or matches[2]=="ظˆغŒط±ط§غŒط´" then
return lock_edit(msg, data, target)
end
if matches[2] == "spam"  or matches[2]=="ط§ط³ظ¾ظ…" then
return lock_spam(msg, data, target)
end
if matches[2] == "flood"  or matches[2]=="ط­ط³ط§ط³غŒطھ" then
return lock_flood(msg, data, target)
end
if matches[2] == "bots"  or matches[2]=="ط±ط¨ط§طھ" then
return lock_bots(msg, data, target)
end
if matches[2] == "markdown" or matches[2]=="ظ…ط§ط±ع©ط¯ظˆظ†" then
return lock_markdown(msg, data, target)
end
if matches[2] == "webpage"  or matches[2]=="ظˆط¨" then
return lock_webpage(msg, data, target)
end
if matches[2] == "pin" and is_owner(msg)  or matches[2]=="ط³ظ†ط¬ط§ظ‚" and is_owner(msg) then
return lock_pin(msg, data, target)
end
if matches[2] == "english"  or matches[2]=="ط§ظ†ع¯ظ„غŒط³غŒ"  then
return lock_english(msg, data, target)
end
if matches[2] == "views"  or matches[2]=="ظˆغŒظˆ" then
return lock_views(msg, data, target)
end
if matches[2] == "emoji"  or matches[2]=="ط§ظ…ظˆط¬غŒ" then
return lock_emoji(msg, data, target)
end
if matches[2] == "fosh"  or matches[2]=="ظپط­ط´" then
return lock_fosh(msg, data, target)
end
if matches[2] == "ads"  or matches[2]=="طھط¨ظ„غŒط؛ط§طھ" then
return lock_ads(msg, data, target)
end
if matches[2] == "tabchi" and is_owner(msg) or matches[2] == "Tabchi" and is_owner(msg) or matches[2] == "طھط¨ع†غŒ" and is_owner(msg)  then
return lock_tabchi(msg, data, target)
end
end

if matches[1] == "unlock" and is_mod(msg) or matches[1]=="ط¨ط§ط²ع©ط±ط¯ظ†" and is_mod(msg) or matches[1] == "Unlock" and is_mod(msg) then
local target = msg.to.id
if matches[2] == "link"  or matches[2]=="ظ„غŒظ†ع©" then
return unlock_link(msg, data, target)
end
if matches[2] == "tag"  or matches[2]=="طھع¯" then
return unlock_tag(msg, data, target)
end
if matches[2] == "mention"  or matches[2]=="ظپط±ط§ط®ظˆط§ظ†غŒ" then
return unlock_mention(msg, data, target)
end
if matches[2] == "arabic"  or matches[2]=="ط¹ط±ط¨غŒ" then
return unlock_arabic(msg, data, target)
end
if matches[2] == "edit"  or matches[2]=="ظˆغŒط±ط§غŒط´" then
return unlock_edit(msg, data, target)
end
if matches[2] == "spam"  or matches[2]=="ط§ط³ظ¾ظ…" then
return unlock_spam(msg, data, target)
end
if matches[2] == "flood" or matches[2]=="ط­ط³ط§ط³غŒطھ" then
return unlock_flood(msg, data, target)
end
if matches[2] == "bots"  or matches[2]=="ط±ط¨ط§طھ" then
return unlock_bots(msg, data, target)
end
if matches[2] == "markdown"  or matches[2]=="ظ…ط§ط±ع©ط¯ظˆظ†" then
return unlock_markdown(msg, data, target)
end
if matches[2] == "webpage" or matches[2]=="ظˆط¨" then
return unlock_webpage(msg, data, target)
end
if matches[2] == "pin" and is_owner(msg)  or matches[2]=="ط³ظ†ط¬ط§ظ‚" and is_owner(msg)  then
return unlock_pin(msg, data, target)
end
if matches[2] == "english" or matches[2]=="ط§ظ†ع¯ظ„غŒط³غŒ"  then
return unlock_english(msg, data, target)
end
if matches[2] == "views" or matches[2]=="ظˆغŒظˆ" then
return unlock_views(msg, data, target)
end
if matches[2] == "emoji" or matches[2]=="ط§ظ…ظˆط¬غŒ" then
return unlock_emoji(msg, data, target)
end
if matches[2] == "fosh"  or matches[2]=="ظپط­ط´" then
return unlock_fosh(msg, data, target)
end
if matches[2] == "ads"  or matches[2]=="طھط¨ظ„غŒط؛ط§طھ" then
return unlock_ads(msg, data, target)
end
if matches[2] == "tabchi" and is_owner(msg) or matches[2] == "Tabchi" and is_owner(msg) or matches[2] == "طھط¨ع†غŒ" and is_owner(msg)  then
return unlock_tabchi(msg, data, target)
end
end

if matches[1] == "mute" and is_mod(msg) or matches[1]== "ظ‚ظپظ„" and is_mod(msg) or matches[1] == "Mute" and is_mod(msg) then
local target = msg.to.id
if matches[2] == "all"  or matches[2]=="ظ‡ظ…ظ‡" then
return mute_all(msg, data, target)
end
if matches[2] == "gif"  or matches[2]=="ع¯غŒظپ" then
return mute_gif(msg, data, target)
end
if matches[2] == "text"  or matches[2]=="ظ…طھظ†" then
return mute_text(msg ,data, target)
end
if matches[2] == "photo"  or matches[2]=="ط¹ع©ط³" then
return mute_photo(msg ,data, target)
end
if matches[2] == "video"  or matches[2]=="ظˆغŒط¯غŒظˆ" then
return mute_video(msg ,data, target)
end
if matches[2] == "audio"  or matches[2]=="ط§ظ‡ظ†ع¯" then
return mute_audio(msg ,data, target)
end
if matches[2] == "voice"  or matches[2]=="ظˆغŒط³" then
return mute_voice(msg ,data, target)
end
if matches[2] == "sticker"  or matches[2]=="ط§ط³طھغŒع©ط±" then
return mute_sticker(msg ,data, target)
end
if matches[2] == "contact"  or matches[2]=="ظ…ط®ط§ط·ط¨" then
return mute_contact(msg ,data, target)
end
if matches[2] == "forward"  or matches[2]=="ظپظˆط±ظˆط§ط±ط¯" then
return mute_forward(msg ,data, target)
end
if matches[2] == "location"  or matches[2]=="ظ…ع©ط§ظ†" then
return mute_location(msg ,data, target)
end
if matches[2] == "document"  or matches[2]=="ظپط§غŒظ„" then
return mute_document(msg ,data, target)
end
if matches[2] == "tgservice"  or matches[2]=="ط³ط±ظˆغŒط³ طھظ„ع¯ط±ط§ظ…" then
return mute_tgservice(msg ,data, target)
end
if matches[2] == "inline" or matches[2]=="ط¯ع©ظ…ظ‡ ط´غŒط´ظ‡ ط§غŒ" then
return mute_inline(msg ,data, target)
end
if matches[2] == "game"  or matches[2]=="ط¨ط§ط²غŒ" then
return mute_game(msg ,data, target)
end
if matches[2] == "keyboard"  or matches[2]=="ع©غŒط¨ظˆط±ط¯" then
return mute_keyboard(msg ,data, target)
end
end

if matches[1] == "unmute" and is_mod(msg) or matches[1]=="ط¨ط§ط²ع©ط±ط¯ظ†" and is_mod(msg) or matches[1] == "Unmute" and is_mod(msg) then
local target = msg.to.id
if matches[2] == "all"  or matches[2]=="ظ‡ظ…ظ‡" then
return unmute_all(msg, data, target)
end
if matches[2] == "gif"  or matches[2]=="ع¯غŒظپ"then
return unmute_gif(msg, data, target)
end
if matches[2] == "text" or matches[2]=="ظ…طھظ†" then
return unmute_text(msg, data, target)
end
if matches[2] == "photo" or matches[2]=="ط¹ع©ط³" then
return unmute_photo(msg ,data, target)
end
if matches[2] == "video" or matches[2]=="ظپغŒظ„ظ…" then
return unmute_video(msg ,data, target)
end
if matches[2] == "audio" or matches[2]=="ط§ظ‡ظ†ع¯" then
return unmute_audio(msg ,data, target)
end
if matches[2] == "voice" or matches[2]=="ظˆغŒط³" then
return unmute_voice(msg ,data, target)
end
if matches[2] == "sticker" or matches[2]=="ط§ط³طھغŒع©ط±" then
return unmute_sticker(msg ,data, target)
end
if matches[2] == "contact" or matches[2]=="ظ…ط®ط§ط·ط¨" then
return unmute_contact(msg ,data, target)
end
if matches[2] == "forward" or matches[2]=="ظپظˆط±ظˆط§ط±ط¯" then
return unmute_forward(msg ,data, target)
end
if matches[2] == "location"  or matches[2]=="ظ…ع©ط§ظ†" then
return unmute_location(msg ,data, target)
end
if matches[2] == "document"  or matches[2]=="ظپط§غŒظ„" then
return unmute_document(msg ,data, target)
end
if matches[2] == "tgservice" or matches[2]=="ط³ط±ظˆغŒط³ طھظ„ع¯ط±ط§ظ…" then
return unmute_tgservice(msg ,data, target)
end
if matches[2] == "inline" or matches[2]=="ط¯ع©ظ…ظ‡ ط´غŒط´ظ‡ ط§غŒ" then
return unmute_inline(msg ,data, target)
end
if matches[2] == "game"  or matches[2]=="ط¨ط§ط²غŒ" then
return unmute_game(msg ,data, target)
end
if matches[2] == "keyboard"   or matches[2]=="ع©غŒط¨ظˆط±ط¯" then
return unmute_keyboard(msg ,data, target)
end
end
if matches[1] == "gpinfo" and is_mod(msg) and msg.to.type == "channel" or matches[1] == "ط§ط·ظ„ط§ط¹ط§طھ ع¯ط±ظˆظ‡" and is_mod(msg) and msg.to.type == "channel" or matches[1] == "Gpinfo" and is_mod(msg) and msg.to.type == "channel" then
local function group_info(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
if not lang then
ginfo = "*Gرڈدƒد…دپ Iخ·ئ’دƒ :*\nًں‘¤_Aâˆ‚ذ¼خ¹خ· Cدƒد…خ·ر‚ :_ *"..data.administrator_count_.."*\nًں‘¥_Mر”ذ¼ذ²ر”رڈ Cدƒد…خ·ر‚ :_ *"..data.member_count_.."*\n_Kخ¹cذ؛ر”âˆ‚ Cدƒد…خ·ر‚ :_ *"..data.kicked_count_.."*\n_Gرڈدƒد…دپ ID :_ *"..data.channel_.id_.."*"
print(serpent.block(data))
elseif lang then
ginfo = "*ط§ط·ظ„ط§ط¹ط§طھ ع¯ط±ظˆظ‡ :*\n_طھط¹ط¯ط§ط¯ ظ…ط¯غŒط±ط§ظ† :_ *"..data.administrator_count_.."*\n_طھط¹ط¯ط§ط¯ ط§ط¹ط¶ط§ :_ *"..data.member_count_.."*\n_طھط¹ط¯ط§ط¯ ط§ط¹ط¶ط§غŒ ط­ط°ظپ ط´ط¯ظ‡ :_ *"..data.kicked_count_.."*\n_ط´ظ†ط§ط³ظ‡ ع¯ط±ظˆظ‡ :_ *"..data.channel_.id_.."*"
print(serpent.block(data))
end
        tdcli.sendMessage(arg.chat_id, arg.msg_id, 1, ginfo, 1, 'md')
end
 tdcli.getChannelFull(msg.to.id, group_info, {chat_id=msg.to.id,msg_id=msg.id})
end
if matches[1] == 'newlink' and is_mod(msg) or  matches[1] == 'ظ„غŒظ†ع© ط¬ط¯غŒط¯' and is_mod(msg) then
			local function callback_link (arg, data)
   local hash = "gp_lang:"..msg.to.id
   local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data) 
				if not data.invite_link_ then
					administration[tostring(msg.to.id)]['settings']['linkgp'] = nil
					save_data(_config.moderation.data, administration)
       if not lang then
       return tdcli.sendMessage(msg.to.id, msg.id, 1, "_Bدƒر‚ خ¹ر• خ·دƒر‚ gرڈدƒد…دپ cرڈر”خ±ر‚دƒرڈ_\n_ر•ر”ر‚ خ± â„“خ¹خ·ذ؛  دƒرڈ ئ’دƒرڈ gرڈدƒد…دپ د‰خ¹ر‚ذ½ د…ر•خ¹خ·g_ /setlink or طھظ†ط¸غŒظ… ظ„غŒظ†ع©", 1, 'md')
       elseif lang then
       return tdcli.sendMessage(msg.to.id, msg.id, 1, "_ط±ط¨ط§طھ ط³ط§ط²ظ†ط¯ظ‡ ع¯ط±ظˆظ‡ ظ†غŒط³طھ_\n_ط¨ط§ ط¯ط³طھظˆط±_ setlink/  _غŒط§ طھظ†ط¸غŒظ… ظ„غŒظ†ع© ظ„غŒظ†ع© ط¬ط¯غŒط¯غŒ ط¨ط±ط§غŒ ع¯ط±ظˆظ‡ ط«ط¨طھ ع©ظ†غŒط¯_", 1, 'md')
    end
				else
					administration[tostring(msg.to.id)]['settings']['linkgp'] = data.invite_link_
					save_data(_config.moderation.data, administration)
        if not lang then
       return tdcli.sendMessage(msg.to.id, msg.id, 1, "*Nر”د‰â„“خ¹خ·ذ؛ Cرڈر”خ±ر‚ر”âˆ‚*", 1, 'md')
        elseif lang then
       return tdcli.sendMessage(msg.to.id, msg.id, 1, "_ظ„غŒظ†ع© ط¬ط¯غŒط¯ ط³ط§ط®طھظ‡ ط´ط¯_", 1, 'md')
     end
					administration[tostring(msg.to.id)]['settings']['linkgp'] = data.invite_link_
					save_data(_config.moderation.data, administration)
				end
			end
 tdcli.exportChatInviteLink(msg.to.id, callback_link, nil)
		end
		if matches[1] == 'setlink' and is_owner(msg) or matches[1] == 'طھظ†ط¸غŒظ… ظ„غŒظ†ع©' and is_owner(msg) or matches[1] == 'Setlink' and is_owner(msg) then
			data[tostring(chat)]['settings']['linkgp'] = 'waiting'
			save_data(_config.moderation.data, data)
      if not lang then
			return '_Please send the new group_ *link* _now_'
    else 
         return 'ظ„ط·ظپط§ ظ„غŒظ†ع© ع¯ط±ظˆظ‡ ط®ظˆط¯ ط±ط§ ط§ط±ط³ط§ظ„ ع©ظ†غŒط¯'
       end
		end

		if msg.text then
   local is_link = msg.text:match("^([https?://w]*.?telegram.me/joinchat/%S+)$") or msg.text:match("^([https?://w]*.?t.me/joinchat/%S+)$")
			if is_link and data[tostring(chat)]['settings']['linkgp'] == 'waiting' and is_owner(msg) then
				data[tostring(chat)]['settings']['linkgp'] = msg.text
				save_data(_config.moderation.data, data)
            if not lang then
				return "*Newlink* _has been set_"
           else
           return "ظ„غŒظ†ع© ط¬ط¯غŒط¯ ط°ط®غŒط±ظ‡ ط´ط¯"
		 	end
       end
		end
    if matches[1] == 'link' and (msg) or  matches[1] == 'ظ„غŒظ†ع©' and (msg) or matches[1] == 'Link' and (msg) then
      local linkgp = data[tostring(chat)]['settings']['linkgp']
      if not linkgp then
       if not lang then
        return "_Fخ¹رڈر•ر‚ cرڈر”خ±ر‚ر” خ± â„“خ¹خ·ذ؛ ئ’دƒرڈ gرڈدƒد…دپ د‰خ¹ر‚ذ½ د…ر•خ¹خ·g_ /newlink or {ظ„غŒظ†ع© ط¬ط¯غŒط¯} \n_Iئ’ ذ²دƒر‚ خ·دƒر‚ gرڈدƒد…دپ cرڈر”خ±ر‚دƒرڈ ر•ر”ر‚ خ± â„“خ¹خ·ذ؛ د‰خ¹ر‚ذ½ د…ر•خ¹خ·g_ /setlink or {طھظ†ط¸غŒظ… ظ„غŒظ†ع©}"
     else
        return "ط§ط¨طھط¯ط§ ط¨ط§ ط¯ط³طھظˆط± newlink/ غŒط§ {ظ„غŒظ†ع© ط¬ط¯غŒط¯} ظ„غŒظ†ع© ط¬ط¯غŒط¯غŒ ط¨ط±ط§غŒ ع¯ط±ظˆظ‡ ط¨ط³ط§ط²غŒط¯\nظˆ ط§ع¯ط± ط±ط¨ط§طھ ط³ط§ط²ظ†ط¯ظ‡ ع¯ط±ظˆظ‡ ظ†غŒط³ ط¨ط§ ط¯ط³طھظˆط± setlink/ غŒط§ {طھظ†ط¸غŒظ… ظ„غŒظ†ع©} ظ„غŒظ†ع© ط¬ط¯غŒط¯غŒ ط¨ط±ط§غŒ ع¯ط±ظˆظ‡ ط«ط¨طھ ع©ظ†غŒط¯"
      end
      end
     if not lang then
       text = "<b>Gرڈدƒد…دپ Lخ¹خ·ذ؛ :</b>\n"..linkgp
     else
      text = "<b>ظ„غŒظ†ع© ع¯ط±ظˆظ‡ :</b>\n"..linkgp
         end
        return tdcli.sendMessage(chat, msg.id, 1, text, 1, 'html')
     end
if matches[1] == 'linkpv' and is_mod(msg) or matches[1] == 'Linkpv' and is_mod(msg) or matches[1] == 'ظ„غŒظ†ع© ظ¾غŒظˆغŒ' and is_mod(msg) then
      local linkgp = data[tostring(chat)]['settings']['linkgp']
      if not linkgp then
      if not lang then
        return "_First create a link for group with using_ /newlink\n_If bot not group creator set a link with using_ /setlink"
     else
        return "ط§ط¨طھط¯ط§ ط¨ط§ ط¯ط³طھظˆط± newlink/ ظ„غŒظ†ع© ط¬ط¯غŒط¯غŒ ط¨ط±ط§غŒ ع¯ط±ظˆظ‡ ط¨ط³ط§ط²غŒط¯\nظˆ ط§ع¯ط± ط±ط¨ط§طھ ط³ط§ط²ظ†ط¯ظ‡ ع¯ط±ظˆظ‡ ظ†غŒط³ ط¨ط§ ط¯ط³طھظˆط± setlink/ ظ„غŒظ†ع© ط¬ط¯غŒط¯غŒ ط¨ط±ط§غŒ ع¯ط±ظˆظ‡ ط«ط¨طھ ع©ظ†غŒط¯"
      end
      end
     if not lang then
     tdcli.sendMessage(user, "", 1, "<b>Group Link "..msg.to.title.." :</b>\n"..linkgp, 1, 'html')
     else
      tdcli.sendMessage(user, "", 1, "<b>ظ„غŒظ†ع© ع¯ط±ظˆظ‡ "..msg.to.title.." :</b>\n"..linkgp, 1, 'html')
         end
      if not lang then
        return "*Group Link Was Send In Your Private Message*"
       else
        return "_ظ„غŒظ†ع© ع¯ط±ظˆظ‡ ط¨ظ‡ ع†طھ ط®طµظˆطµغŒ ط´ظ…ط§ ط§ط±ط³ط§ظ„ ط´ط¯_"
        end
     end
  if matches[1] == "setrules" and matches[2] and is_mod(msg) or matches[1] == "طھظ†ط¸غŒظ… ظ‚ظˆط§ظ†غŒظ†" and matches[2] and is_mod(msg) or matches[1] == "Setrules" and matches[2] and is_mod(msg) then
    data[tostring(chat)]['rules'] = matches[2]
	  save_data(_config.moderation.data, data)
     if not lang then
    return "*Group rules* _has been set_"
   else 
  return "ظ‚ظˆط§ظ†غŒظ† ع¯ط±ظˆظ‡ ط«ط¨طھ ط´ط¯"
   end
  end
  if matches[1] == "rules" or matches[1] == "ظ‚ظˆط§ظ†غŒظ†" or matches[1] == "Rules" then
 if not data[tostring(chat)]['rules'] then
   if not lang then
     rules = "â„¹Rد…â„“ر”ر• :\n1 *Nدƒ Fâ„“دƒدƒâˆ‚*.\n2 *Nدƒ Sدپخ±ذ¼*.\n3 *Nدƒ Aâˆ‚خ½ر”رڈر‚خ¹ر•خ¹خ·g*.\n4 *Tرڈرƒ ر‚دƒ ر•ر‚خ±رƒ دƒخ· ر‚دƒدپخ¹c*.\n5 *Fدƒرڈذ²خ¹âˆ‚âˆ‚ر”خ· خ±خ·رƒ رڈخ±cخ¹ر•ر‚, ر•ر”د‡د…خ±â„“, ذ½دƒذ¼دƒدپذ½دƒذ²خ¹c دƒرڈ gدƒرڈر” cدƒخ·ر‚ر”خ·ر‚*.\nâ‍، *Rر”دپر”خ±ر‚ر”âˆ‚ ئ’خ±خ¹â„“د…رڈر” ر‚دƒ cدƒذ¼دپâ„“رƒ د‰خ¹ر‚ذ½ ر‚ذ½ر”ر•ر” رڈد…â„“ر”ر• د‰خ¹â„“â„“ cخ±د…ر•ر” ذ²خ±خ·.*\n https://t.me/ninjateam20"
    elseif lang then
       rules = "â„¹_ظ‚ظˆط§ظ†غŒظ† :_\n1 _ط§ط±ط³ط§ظ„ ظ¾غŒط§ظ… ظ…ع©ط±ط± ظ…ظ…ظ†ظˆط¹._\n2 _ط§ط³ظ¾ظ… ظ…ظ…ظ†ظˆط¹_.\n3 _طھط¨ظ„غŒط؛ ظ…ظ…ظ†ظˆط¹_.\n4 _ط³ط¹غŒ ع©ظ†غŒط¯ ط§ط² ظ…ظˆط¶ظˆط¹ ط®ط§ط±ط¬ ظ†ط´غŒط¯_.\n5 _ظ‡ط±ظ†ظˆط¹ ظ†عکط§ط¯ ظ¾ط±ط³طھغŒ, ط´ط§ط® ط¨ط§ط²غŒ ظˆ ظ¾ظˆط±ظ†ظˆع¯ط±ط§ظپغŒ ظ…ظ…ظ†ظˆط¹_ .\nâ¬…ï¸ڈ _ط§ط² ظ‚ظˆط§ظ†غŒظ† ظ¾غŒط±ظˆغŒ ع©ظ†غŒط¯, ط¯ط± طµظˆط±طھ ط¹ط¯ظ… ط±ط¹ط§غŒطھ ظ‚ظˆط§ظ†غŒظ† ط§ظˆظ„ ط§ط®ط·ط§ط± ظˆ ط¯ط± طµظˆط±طھ طھع©ط±ط§ط± ظ…ط³ط¯ظˆط¯_.\n https://t.me/ninjateam20"
 end
        else
     rules = "*Group Rules :*\n"..data[tostring(chat)]['rules']
      end
    return rules
  end
if matches[1] == "res" and matches[2] and is_mod(msg) or matches[1] == "Res" and matches[2] and is_mod(msg) or matches[1] == "ط±ط³" and matches[2] and is_mod(msg) then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="res"})
  end
if matches[1] == "whois" and matches[2] and is_mod(msg) or matches[1] == "Whois" and matches[2] and is_mod(msg) or matches[1] == "ط´ط®طµ" and matches[2] and is_mod(msg) then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[2],cmd="whois"})
  end
  if matches[1] == 'setflood' and is_mod(msg) or matches[1] == 'ط­ط³ط§ط³غŒطھ ط§ط³ظ¾ظ…' and is_mod(msg) or matches[1] == 'Setflood' and is_mod(msg) then
			if tonumber(matches[2]) < 1 or tonumber(matches[2]) > 200 then
				return "_Wrong number, range is_ *[1-50]*"
      end
			local flood_max = matches[2]
			data[tostring(chat)]['settings']['num_msg_max'] = flood_max
			save_data(_config.moderation.data, data)
    return "_Group_ *flood* _sensitivity has been set to :_ *[ "..matches[2].." ]*"
       end
		if matches[1]:lower() == 'clean' and is_owner(msg) or matches[1]:lower() == 'ظ¾ط§ع© ع©ط±ط¯ظ†' and is_owner(msg) or matches[1]:lower() == 'Clean' and is_owner(msg) then
			if matches[2] == 'mods' or  matches[2] == 'ظ…ط¯غŒط±ط§ظ†' then
				if next(data[tostring(chat)]['mods']) == nil then
            if not lang then
          return "_Nدƒ_ *ذ¼دƒâˆ‚ر”رڈخ±ر‚دƒرڈر•* _خ¹خ· ر‚ذ½خ¹ر• gرڈدƒد…دپ_"
             else
                return "ظ‡غŒع† ظ…ط¯غŒط±غŒ ط¨ط±ط§غŒ ط±ط¨ط§طھ ط¯ط± ط§غŒظ† ع¯ط±ظˆظ‡ ط§ظ†طھط®ط§ط¨ ظ†ط´ط¯ظ‡ ط§ط³طھ"
				end
            end
				for k,v in pairs(data[tostring(chat)]['mods']) do
					data[tostring(chat)]['mods'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
            if not lang then
        return "_Aâ„“â„“_ *ذ¼دƒâˆ‚ر”رڈخ±ر‚دƒرڈر•* _ذ½خ±ر• ذ²ر”ر”خ· âˆ‚ر”ذ¼دƒر‚ر”âˆ‚_"
          else
            return "طھظ…ط§ظ… ظ…ط¯غŒط±ط§ظ† ط±ط¨ط§طھ ط¯ط± ع¯ط±ظˆظ‡ طھظ†ط²غŒظ„ ظ…ظ‚ط§ظ… ط´ط¯ظ†ط¯"
			end
         end
			if matches[2] == 'filterlist' or matches[2] == 'ظ„غŒط³طھ ظپغŒظ„طھط±' or matches[2] == 'Filterlist' then
				if next(data[tostring(chat)]['filterlist']) == nil then
     if not lang then
          return "*Fخ¹â„“ر‚ر”رڈر”âˆ‚ د‰دƒرڈâˆ‚ر• â„“خ¹ر•ر‚* _خ¹ر• ر”ذ¼دپر‚رƒ_"
         else
          return "_ظ„غŒط³طھ ع©ظ„ظ…ط§طھ ظپغŒظ„طھط± ط´ط¯ظ‡ ط®ط§ظ„غŒ ط§ط³طھ_"
             end
				end
				for k,v in pairs(data[tostring(chat)]['filterlist']) do
					data[tostring(chat)]['filterlist'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
       if not lang then
        return "*Fخ¹â„“ر‚ر”رڈر”âˆ‚ د‰دƒرڈâˆ‚ر• â„“خ¹ر•ر‚* _ذ½خ±ر• ذ²ر”ر”خ· câ„“ر”خ±خ·ر”âˆ‚_"
           else
        return "_ظ„غŒط³طھ ع©ظ„ظ…ط§طھ ظپغŒظ„طھط± ط´ط¯ظ‡ ظ¾ط§ع© ط´ط¯_"
           end
			end
			if matches[2] == 'rules' or matches[2] == 'ظ‚ظˆط§ظ†غŒظ†' or matches[2] == 'Rules' then
				if not data[tostring(chat)]['rules'] then
            if not lang then
          return "_Nدƒ_ *رڈد…â„“ر”ر•* _خ±خ½خ±خ¹â„“خ±ذ²â„“ر”_"
             else
               return "ظ‚ظˆط§ظ†غŒظ† ط¨ط±ط§غŒ ع¯ط±ظˆظ‡ ط«ط¨طھ ظ†ط´ط¯ظ‡ ط§ط³طھ"
             end
				end
					data[tostring(chat)]['rules'] = nil
					save_data(_config.moderation.data, data)
             if not lang then
        return "*Gرڈدƒد…دپ رڈد…â„“ر”ر•* _ذ½خ±ر• ذ²ر”ر”خ· câ„“ر”خ±خ·ر”âˆ‚_"
          else
            return "ظ‚ظˆط§ظ†غŒظ† ع¯ط±ظˆظ‡ ظ¾ط§ع© ط´ط¯"
			end
       end
			if matches[2] == 'welcome' or  matches[2] == 'ظˆظ„ع©ط§ظ…' or matches[2] == 'Welcome' then
				if not data[tostring(chat)]['setwelcome'] then
            if not lang then
					        return "*Wر”â„“cدƒذ¼ر” Mر”ر•ر•خ±gر” خ·دƒر‚ ر•ر”ر‚*"
             else
               return "ظ¾غŒط§ظ… ط®ظˆط´ط¢ظ…ط¯ ع¯ظˆغŒغŒ ط«ط¨طھ ظ†ط´ط¯ظ‡ ط§ط³طھ"
             end
				end
					data[tostring(chat)]['setwelcome'] = nil
					save_data(_config.moderation.data, data)
             if not lang then
        return "*Wر”â„“cدƒذ¼ر” ذ¼ر”ر•ر•خ±gر”* _ذ½خ±ر• ذ²ر”ر”خ· câ„“ر”خ±خ·ر”âˆ‚_"
          else
            return "ظ¾غŒط§ظ… ط®ظˆط´ط¢ظ…ط¯ ع¯ظˆغŒغŒ ظ¾ط§ع© ط´ط¯"
			end
       end
			if matches[2] == 'about'  or matches[2] == 'ط¯ط±ط¨ط§ط±ظ‡ ع¯ط±ظˆظ‡' or matches[2] == 'About' then
        if msg.to.type == "chat" then
				if not data[tostring(chat)]['about'] then
            if not lang then
          return "_Nدƒ_ *âˆ‚ر”ر•cرڈخ¹دپر‚خ¹دƒخ·* _خ±خ½خ±خ¹â„“خ±ذ²â„“ر”_"
            else
              return "ظ¾غŒط§ظ…غŒ ظ…ط¨ظ†غŒ ط¨ط± ط¯ط±ط¨ط§ط±ظ‡ ع¯ط±ظˆظ‡ ط«ط¨طھ ظ†ط´ط¯ظ‡ ط§ط³طھ"
          end
				end
					data[tostring(chat)]['about'] = nil
					save_data(_config.moderation.data, data)
        elseif msg.to.type == "channel" then
   tdcli.changeChannelAbout(chat, "", dl_cb, nil)
             end
             if not lang then
        return "*Gرڈدƒد…دپ âˆ‚ر”ر•cرڈخ¹دپر‚خ¹دƒخ·* _ذ½خ±ر• ذ²ر”ر”خ· câ„“ر”خ±خ·ر”âˆ‚_"
           else
              return "ظ¾غŒط§ظ… ظ…ط¨ظ†غŒ ط¨ط± ط¯ط±ط¨ط§ط±ظ‡ ع¯ط±ظˆظ‡ ظ¾ط§ع© ط´ط¯"
             end
		   	end
        end
		if matches[1]:lower() == 'clean' and is_admin(msg) or matches[1]:lower() == 'ظ¾ط§ع© ع©ط±ط¯ظ†' and is_admin(msg) or matches[1]:lower() == 'Clean' and is_admin(msg) then
			if matches[2] == 'owners' or matches[2] == 'ظ…ط§ظ„ع©' then
				if next(data[tostring(chat)]['owners']) == nil then
             if not lang then
          return "_Nدƒ_ *دƒد‰خ·ر”رڈر•* _خ¹خ· ر‚ذ½خ¹ر• gرڈدƒد…دپ_"
            else
                return "ظ…ط§ظ„ع©غŒ ط¨ط±ط§غŒ ع¯ط±ظˆظ‡ ط§ظ†طھط®ط§ط¨ ظ†ط´ط¯ظ‡ ط§ط³طھ"
            end
				end
				for k,v in pairs(data[tostring(chat)]['owners']) do
					data[tostring(chat)]['owners'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
            if not lang then
		     return "_Aâ„“â„“_ *دƒد‰خ·ر”رڈر•* _ذ½خ±ر• ذ²ر”ر”خ· âˆ‚ر”ذ¼دƒر‚ر”âˆ‚_"
           else
            return "طھظ…ط§ظ…غŒ ظ…ط§ظ„ع©ط§ظ† ع¯ط±ظˆظ‡ طھظ†ط²غŒظ„ ظ…ظ‚ط§ظ… ط´ط¯ظ†ط¯"
          end
			end
     end
if matches[1] == "setname" and matches[2] and is_mod(msg) or matches[1] == "طھظ†ط¸غŒظ… ظ†ط§ظ…" and matches[2] and is_mod(msg) or matches[1] == "Setname" and matches[2] and is_mod(msg) then
local gp_name = matches[2]
tdcli.changeChatTitle(chat, gp_name, dl_cb, nil)
end
  if matches[1] == "setabout" and matches[2] and is_mod(msg) or  matches[1] == "طھظ†ط¸غŒظ… ط¯ط±ط¨ط§ط±ظ‡ ع¯ط±ظˆظ‡" and matches[2] and is_mod(msg) or matches[1] == "Setabout" and matches[2] and is_mod(msg) then
     if msg.to.type == "channel" then
   tdcli.changeChannelAbout(chat, matches[2], dl_cb, nil)
    elseif msg.to.type == "chat" then
    data[tostring(chat)]['about'] = matches[2]
	  save_data(_config.moderation.data, data)
     end
     if not lang then
    return "*Gرڈدƒد…دپ âˆ‚ر”ر•cرڈخ¹دپر‚خ¹دƒخ·* _ذ½خ±ر• ذ²ر”ر”خ· ر•ر”ر‚_"
    else
     return "ظ¾غŒط§ظ… ظ…ط¨ظ†غŒ ط¨ط± ط¯ط±ط¨ط§ط±ظ‡ ع¯ط±ظˆظ‡ ط«ط¨طھ ط´ط¯"
      end
  end
  if matches[1] == "about" and msg.to.type == "chat" or matches[1] == "ط¯ط±ط¨ط§ط±ظ‡ ع¯ط±ظˆظ‡" and msg.to.type == "chat" or matches[1] == "About" and msg.to.type == "chat" then
 if not data[tostring(chat)]['about'] then
     if not lang then
     about = "_Nدƒ_ *âˆ‚ر”ر•cرڈخ¹دپر‚خ¹دƒخ·* _خ±خ½خ±خ¹â„“خ±ذ²â„“ر”_"
      elseif lang then
      about = "ظ¾غŒط§ظ…غŒ ظ…ط¨ظ†غŒ ط¨ط± ط¯ط±ط¨ط§ط±ظ‡ ع¯ط±ظˆظ‡ ط«ط¨طھ ظ†ط´ط¯ظ‡ ط§ط³طھ"
       end
        else
     about = "*Group Description :*\n"..data[tostring(chat)]['about']
      end
    return about
  end
  if matches[1] == 'filter' and is_mod(msg) or matches[1] == 'ظپغŒظ„طھط±' and is_mod(msg) or  matches[1] == 'Filter' and is_mod(msg) then
    return filter_word(msg, matches[2])
  end
  if matches[1] == 'unfilter' and is_mod(msg) or matches[1] == 'ط­ط°ظپ ظپغŒظ„طھط±' and is_mod(msg) or matches[1] == 'Unfilter' and is_mod(msg) then
    return unfilter_word(msg, matches[2])
  end
  if matches[1] == 'filterlist' and is_mod(msg) or  matches[1] == 'ظ„غŒط³طھ ظپغŒظ„طھط±' and is_mod(msg) or matches[1] == 'Filterlist' and is_mod(msg) then
    return filter_list(msg)
  end
if matches[1] == "settings" or matches[1] == "طھظ†ط¸غŒظ…ط§طھ" or matches[1] == "Settings" then
return group_settings(msg, target)
end
if matches[1] == "modlist" or matches[1] == "ظ„غŒط³طھ ظ†ط§ط¸ظ…" or matches[1] == "Modlist" then
return modlist(msg)
end
if matches[1] == "ownerlist" and is_owner(msg) or  matches[1] == "ظ„غŒط³طھ ظ…ط§ظ„ع©ط§ظ†" and is_owner(msg) or matches[1] == "Ownerlist" and is_owner(msg)  then
 return ownerlist(msg)
end

if matches[1] == "setlang" and is_owner(msg) or matches[1] == "طھظ†ط¸غŒظ… ط²ط¨ط§ظ†" and is_owner(msg) or matches[1] == "Setlang" and is_owner(msg) then
   if matches[2] == "en" or matches[2] == "ط§ظ†ع¯ظ„غŒط³غŒ" then
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 redis:del(hash)
return "_Gرڈدƒد…دپ Lخ±خ·gد…خ±gر” Sر”ر‚ Tدƒ:_ ENâœ…"
  elseif matches[2] == "fa" or matches[2] == "ظپط§ط±ط³غŒ" then
redis:set(hash, true)
return "*ط²ط¨ط§ظ† ع¯ط±ظˆظ‡ طھظ†ط¸غŒظ… ط´ط¯ ط¨ظ‡ : ظپط§ط±ط³غŒ*"
end
end


if matches[1] == "help" and is_mod(msg) or matches[1] == "Help" and is_mod(msg) or matches[1] == "ط±ط§ظ‡ظ†ظ…ط§" and is_mod(msg) then
if not lang then
text = [[
âڑœ* TG*

`âڑ،ï¸ڈTo See The CoMmAnDs of YoUr DesiRed iteM SubMiT`

ًں’ *EngliSh CoMmAnDs :*

ًں’¥*>>  Sudohelp*
*ط¯ط³طھظˆط±ط§طھ طµط§ط­ط¨ ط±ط¨ط§طھ ًں‘†ًںڈ»*
`آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»`
ًں’¥*>>  Lockhelp*
*ط¯ط³طھظˆط±ط§طھ ظ‚ظپظ„غŒ ًں‘†ًںڈ»*
`آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»`
ًں’¥*>>  Modhelp*
*ط¯ط³طھظˆط±ط§طھ ظ…ط¯غŒط±غŒطھغŒ ًں‘†ًںڈ»*
`آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»`
ًں’¥*>>  Funhelp*
*ط¯ط³طھظˆط±ط§طھ ظپط§ظ† ًں‘†ًںڈ»*
`آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»`

*> LanGuage BoT EngliSh !*
_To Change The LanGuage_ `[Setlang]` `[en , fa]`

*___________________________*
*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»
*ًںژ­Channel:*@Ninjateam20				
*___________________________*
]]
elseif lang then
text = [[
âڑœ* TG*

`âڑ،ط¨ط±ط§غŒ ط¯غŒط¯ظ† ط¯ط³طھظˆط±ط§طھ ظ…ظˆط±ط¯ ظ†ط¸ط± ط®ظˆط¯ طŒ ظ…ظˆط±ط¯ ط¯ظ„ط®ظˆط§ظ‡ ط±ط§ ط§ط±ط³ط§ظ„ ع©ظ†غŒط¯`ï¸ڈ

ًں’ _ط¯ط³طھظˆط±ط§طھ ظپط§ط±ط³غŒ :_

ًں’¥*>>  ط±ط§ظ‡ظ†ظ…ط§غŒ ط³ط¯ظˆ*
*ط¯ط³طھظˆط±ط§طھ طµط§ط­ط¨ ط±ط¨ط§طھ ًں‘†ًںڈ»*
`آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»`
ًں’¥*>>  ط±ط§ظ‡ظ†ظ…ط§غŒ ظ‚ظپظ„غŒ*
*ط¯ط³طھظˆط±ط§طھ ظ‚ظپظ„غŒ ًں‘†ًںڈ»*
`آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»`
ًں’¥*>>  ط±ط§ظ‡ظ†ظ…ط§غŒ ظ…ط¯غŒط±غŒطھغŒ*
*ط¯ط³طھظˆط±ط§طھ ظ…ط¯غŒط±غŒطھغŒ ًں‘†ًںڈ»*
`آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»`
ًں’¥*>>  ط±ط§ظ‡ظ†ظ…ط§غŒ ظپط§ظ†*
*ط¯ط³طھظˆط±ط§طھ ظپط§ظ† ًں‘†ًںڈ»*
`آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»آ»`

*> ط²ط¨ط§ظ† ط±ط¨ط§طھ ظپط§ط±ط³غŒ !*
_ط¨ط±ط§غŒ طھط؛غŒغŒط± ط²ط¨ط§ظ†_ `[طھظ†ط¸غŒظ… ط²ط¨ط§ظ†]` `[ظپط§ط±ط³غŒ , ط§ظ†ع¯ظ„ط³غŒغŒ]`

*___________________________*
*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»
*ًںژ­Channel:* @Ninjateam20				
*___________________________*
]]
end
return text
end

if matches[1] == "sudohelp" and is_mod(msg) or  matches[1] == "Sudohelp" and is_mod(msg) or  matches[1] == "ط±ط§ظ‡ظ†ظ…ط§غŒ ط³ط¯ظˆ" and is_mod(msg) then
text = [[
âڑœ*ڈ TG*

*Visudo* `[username|id|reply]`
ًں”¹_ط§ط¶ط§ظپظ‡ ع©ط±ط¯ظ† ط³ظˆط¯ظˆ_

*Desudo* `[username|id|reply]`
ًں”¸_ط­ط°ظپ ع©ط±ط¯ظ† ط³ظˆط¯ظˆ_

*Sudolist* 
ًں”¹_ظ„غŒط³طھ ط³ظˆط¯ظˆâ€Œظ‡ط§غŒ ط±ط¨ط§طھ_

*Adminprom* `[username|id|reply]`
ًں”¸_ط§ط¶ط§ظپظ‡ ع©ط±ط¯ظ† ط§ط¯ظ…غŒظ† ط¨ظ‡ ط±ط¨ط§طھ_

*Admindem* `[username|id|reply]`
ًں”¹_ط­ط°ظپ ظپط±ط¯ ط§ط² ط§ط¯ظ…غŒظ†غŒ ط±ط¨ط§طھ_

*Adminlist* 
ًں”¸_ظ„غŒط³طھ ط§ط¯ظ…غŒظ† ظ‡ط§_

*Leave* 
ًں”¹_ط®ط§ط±ط¬ ط´ط¯ظ† ط±ط¨ط§طھ ط§ط² ع¯ط±ظˆظ‡_

*Autoleave* `[disable/enable]`
ًں”¸_ط®ط±ظˆط¬ ط®ظˆط¯ع©ط§ط±_

*Creategroup* `[text]`
ًں”¹_ط³ط§ط®طھ ع¯ط±ظˆظ‡ ط±غŒظ„ظ…_

*Createsuper* `[text]`
ًں”¸_ط³ط§ط®طھ ط³ظˆظ¾ط± ع¯ط±ظˆظ‡_

*Tosuper* 
ًں”¹_طھط¨ط¯غŒظ„ ط¨ظ‡ ط³ظˆظ¾ط± ع¯ط±ظˆظ‡_

*Chats*
ًں”¸_ظ„غŒط³طھ ع¯ط±ظˆظ‡ ظ‡ط§غŒ ظ…ط¯غŒط±غŒطھغŒ ط±ط¨ط§طھ_

*Join* `[id]`
ًں”¹_ط¬ظˆغŒظ† ط´ط¯ظ† طھظˆط³ط· ط±ط¨ط§طھ_

*Rem* `[id]`
ًں”¸_ط­ط°ظپ ع¯ط±ظˆظ‡ ط§ط²ط·ط±غŒظ‚ ظ¾ظ†ظ„ ظ…ط¯غŒط±غŒطھغŒ_

*Import* `[link]`
ًں”¹_ط¬ظˆغŒظ† ط´ط¯ظ† ط±ط¨ط§طھ طھظˆط³ط· ظ„غŒظ†ع©_

*Setbotname* `[text]`
ًں”¸_طھط؛غŒغŒط± ط§ط³ظ… ط±ط¨ط§طھ_

*Setbotusername* `[text]`
ًں”¹_طھط؛غŒغŒط± غŒظˆط²ط±ظ†غŒظ… ط±ط¨ط§طھ_

*Delbotusername* 
ًں”¸_ظ¾ط§ع© ع©ط±ط¯ظ† غŒظˆط²ط±ظ†غŒظ… ط±ط¨ط§طھ_

*Markread* `[off/on]`
ًں”¹_طھغŒع© ط¯ظˆظ…_

*Broadcast* `[text]`
ًں”¸_ظپط±ط³طھط§ط¯ظ† ظ¾غŒط§ظ… ط¨ظ‡ طھظ…ط§ظ… ع¯ط±ظˆظ‡ ظ‡ط§غŒ ظ…ط¯غŒط±غŒطھغŒ ط±ط¨ط§طھ_

*Bc* `[text]` `[gpid]`
ًں”¹_ط§ط±ط³ط§ظ„ ظ¾غŒط§ظ… ظ…ظˆط±ط¯ ظ†ط¸ط± ط¨ظ‡ ع¯ط±ظˆظ‡ ط®ط§طµ_

*Sendfile* `[cd]` `[file]`
ًں”¸_ط§ط±ط³ط§ظ„ ظپط§غŒظ„ ظ…ظˆط±ط¯ظ†ط¸ط± ط§ط² ظ¾ظˆط´ظ‡ ط®ط§طµ_

*Sendplug* `[plug]`
ًں”¹_ط§ط±ط³ط§ظ„ ظ¾ظ„ط§ع¯ ظ…ظˆط±ط¯ ظ†ط¸ط±_

*Save* `[plugin name] [reply]`
ًں”¸_ط°ط®غŒط±ظ‡ ع©ط±ط¯ظ† ظ¾ظ„ط§ع¯غŒظ†_

*Savefile* `[address/filename] [reply]`
ًں”¹_ط°ط®غŒط±ظ‡ ع©ط±ط¯ظ† ظپط§غŒظ„ ط¯ط± ظ¾ظˆط´ظ‡ ظ…ظˆط±ط¯ ظ†ط¸ط±_

*Clear cache*
ًں”¸_ظ¾ط§ع© ع©ط±ط¯ظ† ع©ط´ ظ…ط³غŒط± .telegram-cli/data_

*Check*
ًں”¹_ط§ط¹ظ„ط§ظ… طھط§ط±غŒط® ط§ظ†ظ‚ط¶ط§غŒ ع¯ط±ظˆظ‡_

*Check* `[GroupID]`
ًں”¸_ط§ط¹ظ„ط§ظ… طھط§ط±غŒط® ط§ظ†ظ‚ط¶ط§غŒ ع¯ط±ظˆظ‡ ظ…ظˆط±ط¯ ظ†ط¸ط±_

*Charge* `[GroupID]` `[Number Of Days]`
ًں”¹_طھظ†ط¸غŒظ… طھط§ط±غŒط® ط§ظ†ظ‚ط¶ط§غŒ ع¯ط±ظˆظ‡ ظ…ظˆط±ط¯ ظ†ط¸ط±_

*Charge* `[Number Of Days]`
ًں”¸_طھظ†ط¸غŒظ… طھط§ط±غŒط® ط§ظ†ظ‚ط¶ط§غŒ ع¯ط±ظˆظ‡_

*Jointo* `[GroupID]`
ًں”¹_ط¯ط¹ظˆطھ ط´ط¯ظ† ط´ظ…ط§ طھظˆط³ط· ط±ط¨ط§طھ ط¨ظ‡ ع¯ط±ظˆظ‡ ظ…ظˆط±ط¯ ظ†ط¸ط±_

*Leave* `[GroupID]`
ًں”¸_ط®ط§ط±ط¬ ط´ط¯ظ† ط±ط¨ط§طھ ط§ط² ع¯ط±ظˆظ‡ ظ…ظˆط±ط¯ ظ†ط¸ط±_

ًںچƒ*ط´ظ…ط§ ظ…غŒطھظˆط§ظ†غŒط¯ ط§ط² [!/#] ط¯ط± ط§ظˆظ„ ط¯ط³طھظˆط±ط§طھ ط¨ط±ط§غŒ ط§ط¬ط±ط§غŒ ط¢ظ†ظ‡ط§ ط¨ظ‡ط±ظ‡ ط¨ع¯غŒط±غŒط¯*

âڑ،_ط§غŒظ† ط±ط§ظ‡ظ†ظ…ط§ ظپظ‚ط· ط¨ط±ط§غŒ ط³ظˆط¯ظˆ ظ‡ط§/ط§ط¯ظ…غŒظ† ظ‡ط§غŒ ط±ط¨ط§طھ ظ…غŒط¨ط§ط´ط¯!_

âڑ `ط§غŒظ† ط¨ظ‡ ط§غŒظ† ظ…ط¹ظ†ط§ط³طھ ع©ظ‡ ظپظ‚ط· ط³ظˆط¯ظˆ ظ‡ط§/ط§ط¯ظ…غŒظ† ظ‡ط§غŒ ط±ط¨ط§طھ ظ…غŒطھظˆط§ظ†ظ†ط¯ ط§ط² ط¯ط³طھظˆط±ط§طھ ط¨ط§ظ„ط§ ط§ط³طھظپط§ط¯ظ‡ ع©ظ†ظ†ط¯!`

*ظ…ظˆظپظ‚ ط¨ط§ط´غŒط¯ ;)*

*___________________________*
*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»
*ًںژ­Channel:* @Ninjateam20			
*___________________________*

]]
return text
end

if matches[1] == "lockhelp" and is_mod(msg) or matches[1] == "Lockhelp" and is_mod(msg) or matches[1] == "ط±ط§ظ‡ظ†ظ…ط§غŒ ظ‚ظپظ„غŒ" and is_mod(msg) then
if not lang then
text = [[
ًں’ *EngliSh CoMmAnDs :*

âک†م€‹#Lock commands 

ًں”’*Lock*  

`[link , tag , edit , arabic , webpage , bots , spam , flood , markdown , mention , emoji , ads , fosh]`

`[gif , photo , document , sticker , video , text , forward , location , audio , voice , contact ,tgservice , inline , all , keyboard]`

ًں”“*Unlock* 

 `[link , tag , edit , arabic , webpage , bots , spam , flood , markdown , mention , emoji , ads , fosh]`
 
 
`[gif , photo , document , sticker , video , text , forward , location , audio , voice , contact, tgservice , inline , all , keybord]`


 
 *> LanGuage BoT EngliSh !*
_To Change The LanGuage_ `[Setlang]` `[en , fa]`

*___________________________*
*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»
*ًںژ­Channel:* https://t.me/ninjateam20				
*___________________________*

 ]]
 elseif lang then
 text = [[
ًں’ _ط¯ط³طھظˆط±ط§طھ ظپط§ط±ط³غŒ :_

âک†م€‹#ط¯ط³طھظˆط±ط§طھ ظ‚ظپظ„غŒ 

ًں”’*ظ‚ظپظ„*

`{ظ„غŒظ†ع© طŒ طھع¯ طŒ ظپط±ط§ط®ظˆط§ظ†غŒ طŒ ط§ط³ظ¾ظ… طŒ ط­ط³ط§ط³غŒطھ طŒ ظˆغŒط±ط§غŒط´ طŒ ط±ط¨ط§طھ طŒ ظ…ط§ط±ع©ط¯ظˆظ† طŒ ظˆط¨ طŒ ط³ظ†ط¬ط§ظ‚ طŒ ط§ظ†ع¯ظ„غŒط³غŒ طŒ ط¹ط±ط¨غŒ طŒ ظˆغŒظˆ طŒ ط§ظ…ط¬ظˆ طŒ طھط¨ظ„غŒط؛ط§طھ طŒ ظپط­ط´}`

`{ظ‡ظ…ظ‡ طŒ ع¯غŒظپ طŒ ظ…طھظ† طŒ ط¹ع©ط³ طŒ ظˆغŒط¯غŒظˆ طŒ ط¢ظ‡ظ†ع¯ طŒ ظˆغŒط³ طŒ ط§ط³طھغŒع©ط± طŒ ظ…ط®ط§ط·ط¨ طŒ ظپظˆط±ظˆط§ط¯ طŒ ع©غŒط¨ظˆط±ط¯ طŒ ظپط§غŒظ„ طŒ ظ…ع©ط§ظ† طŒ ط³ط±ظˆغŒط³ طھظ„ع¯ط±ط§ظ… طŒ ط¨ط§ط²غŒ طŒ ط¯ع©ظ…ظ‡ ط´غŒط´ظ‡ ط§غŒ}`

ًں”“*ط¨ط§ط²ع©ط±ط¯ظ†* 

`{ظ„غŒظ†ع© طŒ طھع¯ طŒ ظپط±ط§ط®ظˆط§ظ†غŒ طŒ ط§ط³ظ¾ظ… طŒ ط­ط³ط§ط³غŒطھ طŒ ظˆغŒط±ط§غŒط´ طŒ ط±ط¨ط§طھ طŒ ظ…ط§ط±ع©ط¯ظˆظ† طŒ ظˆط¨ طŒ ط³ظ†ط¬ط§ظ‚ طŒ ط§ظ†ع¯ظ„غŒط³غŒ طŒ ط¹ط±ط¨غŒ طŒ ظˆغŒظˆ طŒ ط§ظ…ط¬ظˆ طŒ طھط¨ظ„غŒط؛ط§طھ طŒ ظپط­ط´}`


`{ظ‡ظ…ظ‡ طŒ ع¯غŒظپ طŒ ظ…طھظ† طŒ ط¹ع©ط³ طŒ ظˆغŒط¯غŒظˆ طŒ ط¢ظ‡ظ†ع¯ طŒ ظˆغŒط³ طŒ ط§ط³طھغŒع©ط± طŒ ظ…ط®ط§ط·ط¨ طŒ ظپظˆط±ظˆط§ط¯ طŒ ع©غŒط¨ظˆط±ط¯ طŒ ظپط§غŒظ„ طŒ ظ…ع©ط§ظ† طŒ ط³ط±ظˆغŒط³ طھظ„ع¯ط±ط§ظ… طŒ ط¨ط§ط²غŒ طŒ ط¯ع©ظ…ظ‡ ط´غŒط´ظ‡ ط§غŒ}`

*> ط²ط¨ط§ظ† ط±ط¨ط§طھ ظپط§ط±ط³غŒ !*
_ط¨ط±ط§غŒ طھط؛غŒغŒط± ط²ط¨ط§ظ†_ `[طھظ†ط¸غŒظ… ط²ط¨ط§ظ†]` `[ظپط§ط±ط³غŒ , ط§ظ†ع¯ظ„ط³غŒغŒ]`

*___________________________*
*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»
*ًںژ­Channel:* https://t.me/ninjateam20				
*___________________________*
]]
end
return text
end

if matches[1] == "modhelp" and is_mod(msg) or matches[1] == "Modhelp" and is_mod(msg) or matches[1] == "ط±ط§ظ‡ظ†ظ…ط§غŒ ظ…ط¯غŒط±غŒطھغŒ" and is_mod(msg) then
if not lang then
text = [[
ًں’ *EngliSh CoMmAnDs :*

âک†م€‹#Modhelp

*Setlang* `[fa - en]`
âڑ،ï¸ڈطھظ†ط¸غŒظ… ط²ط¨ط§ظ† ظ¾ط§ط³ط® ع¯ظˆغŒغŒ ط±ط¨ط§طھ ط¨ظ‡ ط¯ط³طھظˆط±ط§طھ

*Silent* `[username , id , reply]`
ًں’¥ط³ط§ع©طھ ع©ط±ط¯ظ† ظپط±ط¯ (ظ‡ط± ظ¾غŒط§ظ…غŒ ع©ظ‡ ظپط±ط¯ ط¨ط¯ظ‡ط¯ ظ¾ط§ع© ظ…غŒط´ظˆط¯(

*Unsilent* `[username , id , reply]`
âڑ،ï¸ڈط¨ط§ط²ع©ط±ط¯ظ† ط³ط§ع©طھ ط¨ظˆط¯ظ† ظپط±ط¯ 

*Kick* `[username , id , reply]`
ًں’¥ط§ط®ط±ط§ط¬ ظپط±ط¯ ط§ط² ع¯ط±ظˆظ‡

*Ban* `[username , id , reply]`
âڑ،ï¸ڈظ…ط³ط¯ظˆط¯ ع©ط±ط¯ظ† ظپط±ط¯ ظˆ ط§ط¬ط§ط²ظ‡ ظˆط±ظˆط¯ ظ…ط¬ط¯ط¯ ظ†ط¯ط§ط¯ظ†

*Unban* `[username , id , reply]`
ًں’¥ط®ط§ط±ط¬ ط´ط¯ظ† ظپط±ط¯ ط§ط² ط­ط§ظ„طھ ظ…ط³ط¯ظˆط¯ 

*Delall* `[username , id , reply]`
âڑ،ï¸ڈظ¾ط§ع© ع©ط±ط¯ظ† طھظ…ط§ظ… ظ¾غŒط§ظ… ظ‡ط§غŒغŒ ع©ظ‡ ظپط±ط¯ ط¯ط§ط¯ظ‡ ط§ط³طھ ط¯ط± ع¯ط±ظˆظ‡

*Filter* `[text]`
ًں’¥ظپغŒظ„طھط± ع©ظ„ظ…ظ‡ ظ…ظˆط±ط¯ ظ†ط¸ط± ظˆ ظ¾ط§ع© ط´ط¯ظ† ط§ظ†

*Unfilter* `[text]`
âڑ،ï¸ڈط­ط°ظپ ع©ظ„ظ…ظ‡ ظ…ظˆط±ط¯ ظ†ط¸ط± ط§ط² ظ„غŒط³طھ ظپغŒظ„طھط±

*Welcome* `[enable-disable]`
ًں’¥ط±ظˆط´ظ† ظˆ ط®ط§ظ…ظˆط´ ع©ط±ط¯ظ† ط®ظˆط´ ط§ظ…ظپط¹ط§ظ„

*Mt* [3 4]
âڑ،ï¸ڈطھظ†ط¸غŒظ… ط¨غŒطµط¯ط§ ط¨ظ‡ طµظˆط±طھ ط³ط§ط¹طھ ظˆط¯ظ‚غŒظ‚ظ‡

*Unmt*
ًں’¥ط¨ط§ط²ع©ط±ط¯ظ† ط¨غŒطµط¯ط§ ط²ظ…ط§ظ† ط¯ط§ط±

*Promote* `[username , id , reply]`
ًں’¥طھظ†ط¸غŒظ… ظپط±ط¯ ط¨ظ‡ ط¹ظ†ظˆط§ظ† ظ…ط¹ط§ظˆظ† ط±ط¨ط§طھ ط¯ط± ع¯ط±ظˆظ‡

*Demote* `[username , id , reply]`
ًں’¥طھظ†ط²ظ„ ظ…ظ‚ط§ظ… ظپط±ط¯ ط§ط² ظ…ط¹ط§ظˆظ† ط±ط¨ط§طھ ط¨ط±ط§غŒ ع¯ط±ظˆظ‡

*Settings*
âڑ،ï¸ڈط¯ط±غŒط§ظپطھ ظ„غŒط³طھ طھظ†ط¸غŒظ…ط§طھ

*Modelist*
ًں’¥ط¯ط±غŒط§ظپطھ ظ„غŒط³طھ ظ…ط¹ط§ظˆظ† ظ‡ط§غŒ ع¯ط±ظˆظ‡

*Ownerlist*
âڑ،ï¸ڈط¯ط±غŒط§ظپطھ ظ„غŒط³طھ ظ…ط¯غŒط±ط§ظ† ع¯ط±ظˆظ‡ 

*Silentlist*
ًں’¥ط¯ط±غŒط§ظپطھ ظ„غŒط³طھ ط³ط§ع©طھ ظ‡ط§

*Filterlist*
âڑ،ï¸ڈط¯ط±غŒط§ظپطھ ظ„غŒط³طھ ع©ظ„ظ…ط§طھ ظپغŒظ„طھط±

*Setflood* `[1-50]`
ًں’¥طھظ†ط¸غŒظ… ط­ط³ط§ط³غŒطھ ظ¾غŒط§ظ… ظ…ع©ط±ط±

*Set* `[rules , name , link , about]`
âڑ،ï¸ڈطھظ†ط¸غŒظ… ط¨ظ‡ طھط±طھغŒط¨ [ظ‚ظˆط§ظ†غŒظ† طŒ ط§ط³ظ… طŒ ظ„غŒظ†ع© طŒ ط¯ط±ط¨ط§ط±ظ‡ طŒ ] ط¨ط±ط§غŒ ع¯ط±ظˆظ‡

*Setwelcome* `[text]`
ًں’¥طھظ†ط¸غŒظ… ط®ظˆط´ ط§ظ…ط¯ ط¨ط±ط§غŒ ع¯ط±ظˆظ‡

*Res* `[username]`
âڑ،ï¸ڈظ†ظ…ط§غŒط´ ط§ط·ظ„ط§ط¹ط§طھ غŒظˆط²ط±ظ†غŒظ…

*Whois* `[id]`
ًں’¥ظ†ظ…ط§غŒط´ ط§ط·ظ„ط§ط¹ط§طھ ط¨ط±ط§غŒ ط§غŒط¯غŒ ط¹ط¯ط¯غŒ

*Pin* `[reply]`
âڑ،ï¸ڈظ¾غŒظ† ظ¾غŒط§ظ… ظ…ظˆط±ط¯ ظ†ط¸ط± ط¯ط± ع¯ط±ظˆظ‡

*Unpin* `[reply]`
ًں’¥ط¨ط±ط¯ط§ط´طھظ† ظ¾غŒط§ظ… ط§ط² ط­ط§ظ„طھ ظ¾غŒظ†

*Rules* 
âڑ،ï¸ڈظ†ظ…ط§غŒط´ ظ‚ظˆط§ظ†غŒظ† ع¯ط±ظˆظ‡

*About*
ًں’¥ظ†ظ…ط§غŒط´ ط¯ط±ط¨ط§ط±ظ‡ ع¯ط±ظˆظ‡

*Gpinfo*
âڑ،ï¸ڈظ†ظ…ط§غŒط´ ط§ط·ظ„ط§ط¹ط§طھ ع¯ط±ظˆظ‡

*Link*
ًں’¥ط¯ط±غŒط§ظپطھ ظ„غŒظ†ع© ع¯ط±ظˆظ‡

 *> LanGuage BoT EngliSh !*
_To Change The LanGuage_ `[Setlang]` `[en , fa]`

*___________________________*
*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»
*ًںژ­Channel:*@Ninjateam20				
*___________________________*
]]
elseif lang then
text = [[
ًں’ _ط¯ط³طھظˆط±ط§طھ ظپط§ط±ط³غŒ :_

âک†م€‹#ط¯ط³طھظˆط±ط§طھ ظ…ط¯غŒط±غŒطھغŒ

*طھظ†ط¸غŒظ… ط²ط¨ط§ظ†* `[ظپط§ط±ط³غŒ - ط§ظ†ع¯ظ„غŒط³غŒ]`
âڑ،ï¸ڈطھظ†ط¸غŒظ… ط²ط¨ط§ظ† ظ¾ط§ط³ط® ع¯ظˆغŒغŒ ط±ط¨ط§طھ ط¨ظ‡ ط¯ط³طھظˆط±ط§طھ

*طھط­ط±غŒظ…* `[username , id , reply]`
ًں’¥ط³ط§ع©طھ ع©ط±ط¯ظ† ظپط±ط¯ (ظ‡ط± ظ¾غŒط§ظ…غŒ ع©ظ‡ ظپط±ط¯ ط¨ط¯ظ‡ط¯ ظ¾ط§ع© ظ…غŒط´ظˆط¯(

*ظ„ط؛ظˆطھط­ط±غŒظ…* `[username , id , reply]`
âڑ،ï¸ڈط¨ط§ط²ع©ط±ط¯ظ† ط³ط§ع©طھ ط¨ظˆط¯ظ† ظپط±ط¯ 

*ط§ط®ط±ط§ط¬* `[username , id , reply]`
ًں’¥ط§ط®ط±ط§ط¬ ظپط±ط¯ ط§ط² ع¯ط±ظˆظ‡

*ط¨ظ†* `[username , id , reply]`
âڑ،ï¸ڈظ…ط³ط¯ظˆط¯ ع©ط±ط¯ظ† ظپط±ط¯ ظˆ ط§ط¬ط§ط²ظ‡ ظˆط±ظˆط¯ ظ…ط¬ط¯ط¯ ظ†ط¯ط§ط¯ظ†

*ط§ظ†ط¨ظ†* `[username , id , reply]`
ًں’¥ط®ط§ط±ط¬ ط´ط¯ظ† ظپط±ط¯ ط§ط² ط­ط§ظ„طھ ظ…ط³ط¯ظˆط¯ 

*ط­ط°ظپ ظ‡ظ…ظ‡* `[username , id , reply]`
âڑ،ï¸ڈظ¾ط§ع© ع©ط±ط¯ظ† طھظ…ط§ظ… ظ¾غŒط§ظ… ظ‡ط§غŒغŒ ع©ظ‡ ظپط±ط¯ ط¯ط§ط¯ظ‡ ط§ط³طھ ط¯ط± ع¯ط±ظˆظ‡

*ظپغŒظ„طھط±* `[text]`
ًں’¥ظپغŒظ„طھط± ع©ظ„ظ…ظ‡ ظ…ظˆط±ط¯ ظ†ط¸ط± ظˆ ظ¾ط§ع© ط´ط¯ظ† ط§ظ†

*ط­ط°ظپ ظپغŒظ„طھط±* `[text]`
âڑ،ï¸ڈط­ط°ظپ ع©ظ„ظ…ظ‡ ظ…ظˆط±ط¯ ظ†ط¸ط± ط§ط² ظ„غŒط³طھ ظپغŒظ„طھط±

*ظˆظ„ع©ط§ظ…* `[ظپط¹ط§ظ„-ط؛غŒط± ظپط¹ط§ظ„]`
ًں’¥ظپط¹ط§ظ„ ظˆ ط؛غŒط± ظپط¹ط§ظ„ ع©ط±ط¯ظ† ط®ظˆط´ ط¢ظ…ط¯ ع¯ظˆغŒ

*ط³ع©ظˆطھ* `[3 4]`
âڑ،ï¸ڈطھظ†ط¸غŒظ… ط¨غŒطµط¯ط§ ط¨ظ‡ طµظˆط±طھ ط³ط§ط¹طھ ظˆط¯ظ‚غŒظ‚ظ‡

*ظ„ط؛ظˆط³ع©ظˆطھ*
ًں’¥ط¨ط§ط²ع©ط±ط¯ظ† ط¨غŒطµط¯ط§ ط²ظ…ط§ظ† ط¯ط§ط±

*طھط±ظپغŒط¹* `[username , id , reply]`
ًں”¥طھظ†ط¸غŒظ… ظپط±ط¯ ط¨ظ‡ ط¹ظ†ظˆط§ظ† ظ…ط¹ط§ظˆظ† ط±ط¨ط§طھ ط¯ط± ع¯ط±ظˆظ‡

*ط¹ط²ظ„* `[username , id , reply]`
âڑ،طھظ†ط²ظ„ ظ…ظ‚ط§ظ… ظپط±ط¯ ط§ط² ظ…ط¹ط§ظˆظ† ط±ط¨ط§طھ ط¨ط±ط§غŒ ع¯ط±ظˆظ‡

*طھظ†ط¸غŒظ…ط§طھ*
âڑ،ï¸ڈط¯ط±غŒط§ظپطھ ظ„غŒط³طھ طھظ†ط¸غŒظ…ط§طھ

*ظ„غŒط³طھ ظ†ط§ط¸ظ…*
ًں’¥ط¯ط±غŒط§ظپطھ ظ„غŒط³طھ ظ…ط¹ط§ظˆظ† ظ‡ط§غŒ ع¯ط±ظˆظ‡

*ظ„غŒط³طھ ظ…ط§ظ„ع©ط§ظ†*
âڑ،ï¸ڈط¯ط±غŒط§ظپطھ ظ„غŒط³طھ ظ…ط¯غŒط±ط§ظ† ع¯ط±ظˆظ‡ 

*ظ„غŒط³طھ طھط­ط±غŒظ…*
ًں’¥ط¯ط±غŒط§ظپطھ ظ„غŒط³طھ ط³ط§ع©طھ ظ‡ط§

*ظ„غŒط³طھ ظپغŒظ„طھط±*
âڑ،ï¸ڈط¯ط±غŒط§ظپطھ ظ„غŒط³طھ ع©ظ„ظ…ط§طھ ظپغŒظ„طھط±

*ط­ط³ط§ط³غŒطھ ط§ط³ظ¾ظ…* `[1-50]`
ًں’¥طھظ†ط¸غŒظ… ط­ط³ط§ط³غŒطھ ظ¾غŒط§ظ… ظ…ع©ط±ط±

âڑ،ï¸ڈ*طھظ†ط¸غŒظ…* 
`[ظ‚ظˆط§ظ†غŒظ† طŒ ظ„غŒظ†ع© طŒ ط¯ط±ط¨ط§ط±ظ‡ ع¯ط±ظˆظ‡طŒ ]`

*طھظ†ط¸غŒظ… ظˆظ„ع©ط§ظ…* `[text]`
âڑ،ï¸ڈطھظ†ط¸غŒظ… ط®ظˆط´ ط§ظ…ط¯ ط¨ط±ط§غŒ ع¯ط±ظˆظ‡

*ط±ط³* `[username]`
ًں’¥ظ†ظ…ط§غŒط´ ط§ط·ظ„ط§ط¹ط§طھ غŒظˆط²ط±ظ†غŒظ…

*ط´ط®طµ* `[id]`
âڑ،ï¸ڈظ†ظ…ط§غŒط´ ط§ط·ظ„ط§ط¹ط§طھ ط¨ط±ط§غŒ ط§غŒط¯غŒ ط¹ط¯ط¯غŒ

*ط³ظ†ط¬ط§ظ‚* `[reply]`
ًں’¥ظ¾غŒظ† ظ¾غŒط§ظ… ظ…ظˆط±ط¯ ظ†ط¸ط± ط¯ط± ع¯ط±ظˆظ‡

*ط¨ط±ط¯ط§ط´طھظ† ط³ظ†ط¬ط§ظ‚* `[reply]`
âڑ،ï¸ڈط¨ط±ط¯ط§ط´طھظ† ظ¾غŒط§ظ… ط§ط² ط­ط§ظ„طھ ظ¾غŒظ†

*ظ‚ظˆط§ظ†غŒظ†* 
ًں’¥ظ†ظ…ط§غŒط´ ظ‚ظˆط§ظ†غŒظ† ع¯ط±ظˆظ‡

*ط§ط·ظ„ط§ط¹ط§طھ ع¯ط±ظˆظ‡*
âڑ،ï¸ڈظ†ظ…ط§غŒط´ ط§ط·ظ„ط§ط¹ط§طھ ع¯ط±ظˆظ‡

*ظ„غŒظ†ع©*
ًں’¥ط¯ط±غŒط§ظپطھ ظ„غŒظ†ع© ع¯ط±ظˆظ‡

*> ط²ط¨ط§ظ† ط±ط¨ط§طھ ظپط§ط±ط³غŒ !*
_ط¨ط±ط§غŒ طھط؛غŒغŒط± ط²ط¨ط§ظ†_ `[طھظ†ط¸غŒظ… ط²ط¨ط§ظ†]` `[ظپط§ط±ط³غŒ , ط§ظ†ع¯ظ„ط³غŒغŒ]`

*___________________________*
*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»
*ًںژ­Channel:* @Ninjateam20				
*___________________________*
]]
end
return text
end

if matches[1] == "funhelp" and is_mod(msg) or matches[1] == "Funhelp" and is_mod(msg) or matches[1] == "ط±ط§ظ‡ظ†ظ…ط§غŒ ظپط§ظ†" and is_mod(msg)  then
if not lang then
text = [[
ًں’ *EngliSh CoMmAnDs :*

*Azan* `[name city]`
âڑœط¯ط±غŒط§ظپطھ ط§ط·ظ„ط§ط¹ط§طھ ط§ط°ط§ظ† ط´ظ‡ط± ظ…ظˆط±ط¯ ظ†ط¸ط±

*Info*
ًں”»ط¯ط±غŒط§ظپطھ ط§ط·ظ„ط§ط¹ط§طھ ط´ظ…ط§

*Me*
âڑœط¯ط±غŒط§ظپطھ ظ…ظ‚ط§ظ… ط´ظ…ط§ ط¯ط± ط±ط¨ط§طھ

*Ping*
ًں”»ط§ط·ظ„ط§ط¹ ط§ط² ط§ظ†ظ„ط§غŒظ† ط¨ظˆط¯ظ† ط±ط¨ط§طھ

*Time*
âڑœط¯ط±غŒط§ظپطھ ط²ظ…ط§ظ† ظˆ طھط§ط±غŒط® ط§ظ…ط±ظˆط²

*Write* `[text]`
ًں”»ظ†ظˆط´طھظ† ع©ظ„ظ…ظ‡ ط¨ط§ غ±غ°غ° ظپظˆظ†طھ ظ…ط®طھظ„ظپ

*Nerkh*
âڑœط¯ط±غŒط§ظپطھ ظ‚غŒظ…طھ ط±ط¨ط§طھ ط¬ظ‡طھ ط®ط±غŒط¯

*Weather* `[city]`
ًں”»ط¯ط±غŒط§ظپطھ ط§ط¨ ظˆظ‡ظˆط§ ط´ظ‡ط± ظ…ظˆط±ط¯ ظ†ط¸ط±

*Calc* `[number]`
âڑœظ…ط§ط´غŒظ† ط­ط³ط§ط¨ 

*Tr* `[lang] [word]`
ًں”»طھط±ط¬ظ…ظ‡ ظ…طھظ† ظپط§ط±ط³غŒ ط¨ظ‡ ط§ظ†ع¯ظ„غŒط³غŒ ظˆط¨ط±ط¹ع©ط³
_ظ…ط«ط§ظ„:_
_Tr en ط³ظ„ط§ظ…_

*Short* `[link]`
âڑœع©ظˆطھط§ظ‡ ع©ظ†ظ†ط¯ظ‡ ظ„غŒظ†ع©

*Voice* `[text]`
ًں”»طھط¨ط¯غŒظ„ ظ…طھظ† ط¨ظ‡ طµط¯ط§

*Sticker* `[word]`
âڑœطھط¨ط¯غŒظ„ ظ…طھظ† ط¨ظ‡ ط§ط³طھغŒع©ط±

*Photo* `[word]`
ًں”»طھط¨ط¯غŒظ„ ظ…طھظ† ط¨ظ‡ ط¹ع©ط³

*Tosticker* `[reply]`
âڑœطھط¨ط¯غŒظ„ ط¹ع©ط³ ط¨ظ‡ ط§ط³طھغŒع©ط±

*Tophoto* `[reply]`
ًں”»طھط¨ط¯غŒظ„ ط§ط³طھغŒع©ط±â€Œ ط¨ظ‡ ط¹ع©ط³

 *> LanGuage BoT EngliSh !*
_To Change The LanGuage_ `[Setlang]` `[en , fa]`

*___________________________*
*ًںژ­Pwered By :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»
*ًںژ­Channel:* @Ninjateam20				
*___________________________*
]]
elseif lang then
text = [[
ًں’ _ط¯ط³طھظˆط±ط§طھ ظپط§ط±ط³غŒ :_

*ط§ط°ط§ظ†* [ظ†ط§ظ… ط´ظ‡ط±]
âڑœط¯ط±غŒط§ظپطھ ط§ط·ظ„ط§ط¹ط§طھ ط§ط°ط§ظ† ط´ظ‡ط± ظ…ظˆط±ط¯ ظ†ط¸ط±

*ط§ط·ظ„ط§ط¹ط§طھ ظ…ظ†*
ًں”»ط¯ط±غŒط§ظپطھ ط§ط·ظ„ط§ط¹ط§طھ ط´ظ…ط§

*ظ…ظ‚ط§ظ… ظ…ظ†*
âڑœط¯ط±غŒط§ظپطھ ظ…ظ‚ط§ظ… ط´ظ…ط§ ط¯ط± ط±ط¨ط§طھ

*ط§ظ†ظ„ط§غŒظ†غŒ*
ًں”»ط§ط·ظ„ط§ط¹ ط§ط² ط§ظ†ظ„ط§غŒظ† ط¨ظˆط¯ظ† ط±ط¨ط§طھ

*ط³ط§ط¹طھ*
âڑœط¯ط±غŒط§ظپطھ ط²ظ…ط§ظ† ظˆ طھط§ط±غŒط® ط§ظ…ط±ظˆط²

*ظ†ظˆط´طھظ†* [ظ…طھظ†]
ًں”»ظ†ظˆط´طھظ† ع©ظ„ظ…ظ‡ ط¨ط§ غ±غ°غ° ظپظˆظ†طھ ظ…ط®طھظ„ظپ

*ظ†ط±ط®*
âڑœط¯ط±غŒط§ظپطھ ظ‚غŒظ…طھ ط±ط¨ط§طھ ط¬ظ‡طھ ط®ط±غŒط¯

*ط§ط¨ ظˆ ظ‡ظˆط§* `[ط´ظ‡ط±]`
ًں”»ط¯ط±غŒط§ظپطھ ط§ط¨ ظˆظ‡ظˆط§ ط´ظ‡ط± ظ…ظˆط±ط¯ ظ†ط¸ط±

*ط­ط³ط§ط¨* `[ط¹ط¯ط¯]`
âڑœظ…ط§ط´غŒظ† ط­ط³ط§ط¨ 

*طھط±ط¬ظ…ظ‡* `[ط²ط¨ط§ظ†] [ع©ظ„ظ…ظ‡]`
ًں”»طھط±ط¬ظ…ظ‡ ظ…طھظ† ظپط§ط±ط³غŒ ط¨ظ‡ ط§ظ†ع¯ظ„غŒط³غŒ ظˆط¨ط±ط¹ع©ط³
_ظ…ط«ط§ظ„:_
_طھط±ط¬ظ…ظ‡ en ط³ظ„ط§ظ…_

*ع©ظˆطھط§ظ‡* `[ظ„غŒظ†ع©]`
âڑœع©ظˆطھط§ظ‡ ع©ظ†ظ†ط¯ظ‡ ظ„غŒظ†ع©

*ظˆغŒط³* `[ظ…طھظ†]`
ًں”»طھط¨ط¯غŒظ„ ظ…طھظ† ط¨ظ‡ طµط¯ط§

*ط§ط³طھغŒع©ط±* `[ع©ظ„ظ…ظ‡]`
âڑœطھط¨ط¯غŒظ„ ظ…طھظ† ط¨ظ‡ ط§ط³طھغŒع©ط±

*ط¹ع©ط³* `[ع©ظ„ظ…ظ‡]`
ًں”»طھط¨ط¯غŒظ„ ظ…طھظ† ط¨ظ‡ ط¹ع©ط³

*ط¨ظ‡ ط§ط³طھغŒع©ط±* `[ط±غŒظ¾ظ„ط§غŒ]`
âڑœطھط¨ط¯غŒظ„ ط¹ع©ط³ ط¨ظ‡ ط§ط³طھغŒع©ط±

*ط¨ظ‡ ط¹ع©ط³* `[ط±غŒظ¾ظ„ط§غŒ]`
ًں”»طھط¨ط¯غŒظ„ ط§ط³طھغŒع©ط±â€Œ ط¨ظ‡ ط¹ع©ط³

*> ط²ط¨ط§ظ† ط±ط¨ط§طھ ظپط§ط±ط³غŒ !*
_ط¨ط±ط§غŒ طھط؛غŒغŒط± ط²ط¨ط§ظ†_ `[طھظ†ط¸غŒظ… ط²ط¨ط§ظ†]` `[ظپط§ط±ط³غŒ , ط§ظ†ع¯ظ„ط³غŒغŒ]`

*___________________________*
*ًںژ­ط¨ط±ظ†ط§ظ…ظ‡ ظ†ظˆغŒط³ :*ًں’»ï¼®ï½‰ï½ژï½ٹï½پï¼´ï¼­ًں’»
*ًںژ­Channel:* @Ninjateam20				
*___________________________*
]]
end
return text
end
--------------------- Welcome -----------------------
	if matches[1] == "welcome" and is_mod(msg) or matches[1] == "Welcome" and is_mod(msg) or matches[1] == "ظˆظ„ع©ط§ظ…" and is_mod(msg) then
		if matches[2] == "enable" or matches[2] == "ظپط¹ط§ظ„" then
			welcome = data[tostring(chat)]['settings']['welcome']
			if welcome == "yes" then
       if not lang then
				return "_Group_ *welcome* _is already enabled_"
       elseif lang then
				return "_ط®ظˆط´ط¢ظ…ط¯ ع¯ظˆغŒغŒ ط§ط² ظ‚ط¨ظ„ ظپط¹ط§ظ„ ط¨ظˆط¯_"
           end
			else
		data[tostring(chat)]['settings']['welcome'] = "yes"
	    save_data(_config.moderation.data, data)
       if not lang then
				return "_Group_ *welcome* _has been enabled_"
       elseif lang then
				return "_ط®ظˆط´ط¢ظ…ط¯ ع¯ظˆغŒغŒ ظپط¹ط§ظ„ ط´ط¯_"
          end
			end
		end
		
		if matches[2] == "disable" or matches[2] == "ط؛غŒط± ظپط¹ط§ظ„" then
			welcome = data[tostring(chat)]['settings']['welcome']
			if welcome == "no" then
      if not lang then
				return "_Group_ *Welcome* _is already disabled_"
      elseif lang then
				return "_ط®ظˆط´ط¢ظ…ط¯ ع¯ظˆغŒغŒ ط§ط² ظ‚ط¨ظ„ ظپط¹ط§ظ„ ظ†ط¨ظˆط¯_"
         end
			else
		data[tostring(chat)]['settings']['welcome'] = "no"
	    save_data(_config.moderation.data, data)
      if not lang then
				return "_Group_ *welcome* _has been disabled_"
      elseif lang then
				return "_ط®ظˆط´ط¢ظ…ط¯ ع¯ظˆغŒغŒ ط؛غŒط±ظپط¹ط§ظ„ ط´ط¯_"
          end
			end
		end
	end
	if matches[1] == "setwelcome" and matches[2] and is_mod(msg) or matches[1] == "Setwelcome" and matches[2] and is_mod(msg) or matches[1] == "طھظ†ط¸غŒظ… ظˆظ„ع©ط§ظ…" and matches[2] and is_mod(msg) then
		data[tostring(chat)]['setwelcome'] = matches[2]
	    save_data(_config.moderation.data, data)
       if not lang then
		return "_Welcome Message Has Been Set To :_\n*"..matches[2].."*\n\n*You can use :*\n_{gpname} Group Name_\n_{rules} â‍£ Show Group Rules_\n_{name} â‍£ New Member First Name_\n_{username} â‍£ New Member Username_"
       else
		return "_ظ¾غŒط§ظ… ط®ظˆط´ط¢ظ…ط¯ ع¯ظˆغŒغŒ طھظ†ط¸غŒظ… ط´ط¯ ط¨ظ‡ :_\n*"..matches[2].."*\n\n*ط´ظ…ط§ ظ…غŒطھظˆط§ظ†غŒط¯ ط§ط²*\n_{gpname} ظ†ط§ظ… ع¯ط±ظˆظ‡_\n_{rules} â‍£ ظ†ظ…ط§غŒط´ ظ‚ظˆط§ظ†غŒظ† ع¯ط±ظˆظ‡_\n_{name} â‍£ ظ†ط§ظ… ع©ط§ط±ط¨ط± ط¬ط¯غŒط¯_\n_{username} â‍£ ظ†ط§ظ… ع©ط§ط±ط¨ط±غŒ ع©ط§ط±ط¨ط± ط¬ط¯غŒط¯_\n_ط§ط³طھظپط§ط¯ظ‡ ع©ظ†غŒط¯_"
        end
     end
	end
end
-----------------------------------------
local function pre_process(msg)
   local chat = msg.to.id
   local user = msg.from.id
 local data = load_data(_config.moderation.data)
	local function welcome_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
		administration = load_data(_config.moderation.data)
    if administration[arg.chat_id]['setwelcome'] then
     welcome = administration[arg.chat_id]['setwelcome']
      else
     if not lang then
     welcome = "*Welcome Dude*"
    elseif lang then
     welcome = "_ط®ظˆط´ ط¢ظ…ط¯غŒط¯_"
        end
     end
 if administration[tostring(arg.chat_id)]['rules'] then
rules = administration[arg.chat_id]['rules']
else
   if not lang then
     rules = "â„¹ï¸ڈ The Default Rules :\n1âƒ£ No Flood.\n2âƒ£ No Spam.\n3âƒ£ No Advertising.\n4âƒ£ Try to stay on topic.\n5âƒ£ Forbidden any racist, sexual, homophobic or gore content.\nâ‍،ï¸ڈ Repeated failure to comply with these rules will cause ban."
    elseif lang then
       rules = "â„¹ï¸ڈ ظ‚ظˆط§ظ†غŒظ† ظ¾ظ¾غŒط´ظپط±ط¶:\n1âƒ£ ط§ط±ط³ط§ظ„ ظ¾غŒط§ظ… ظ…ع©ط±ط± ظ…ظ…ظ†ظˆط¹.\n2âƒ£ ط§ط³ظ¾ظ… ظ…ظ…ظ†ظˆط¹.\n3âƒ£ طھط¨ظ„غŒط؛ ظ…ظ…ظ†ظˆط¹.\n4âƒ£ ط³ط¹غŒ ع©ظ†غŒط¯ ط§ط² ظ…ظˆط¶ظˆط¹ ط®ط§ط±ط¬ ظ†ط´غŒط¯.\n5âƒ£ ظ‡ط±ظ†ظˆط¹ ظ†عکط§ط¯ ظ¾ط±ط³طھغŒ, ط´ط§ط® ط¨ط§ط²غŒ ظˆ ظ¾ظˆط±ظ†ظˆع¯ط±ط§ظپغŒ ظ…ظ…ظ†ظˆط¹ .\nâ‍،ï¸ڈ ط§ط² ظ‚ظˆط§ظ†غŒظ† ظ¾غŒط±ظˆغŒ ع©ظ†غŒط¯, ط¯ط± طµظˆط±طھ ط¹ط¯ظ… ط±ط¹ط§غŒطھ ظ‚ظˆط§ظ†غŒظ† ط§ظˆظ„ ط§ط®ط·ط§ط± ظˆ ط¯ط± طµظˆط±طھ طھع©ط±ط§ط± ظ…ط³ط¯ظˆط¯."
 end
end
if data.username_ then
user_name = "@"..check_markdown(data.username_)
else
user_name = ""
end
		local welcome = welcome:gsub("{rules}", rules)
		local welcome = welcome:gsub("{name}", check_markdown(data.first_name_))
		local welcome = welcome:gsub("{username}", user_name)
		local welcome = welcome:gsub("{gpname}", arg.gp_name)
		tdcli.sendMessage(arg.chat_id, arg.msg_id, 0, welcome, 0, "md")
	end
	if data[tostring(chat)] and data[tostring(chat)]['settings'] then
	if msg.adduser then
		welcome = data[tostring(msg.to.id)]['settings']['welcome']
		if welcome == "yes" then
			tdcli_function ({
	      ID = "GetUser",
      	user_id_ = msg.adduser
    	}, welcome_cb, {chat_id=chat,msg_id=msg.id,gp_name=msg.to.title})
		else
			return false
		end
	end
	if msg.joinuser then
		welcome = data[tostring(msg.to.id)]['settings']['welcome']
		if welcome == "yes" then
			tdcli_function ({
	      ID = "GetUser",
      	user_id_ = msg.joinuser
    	}, welcome_cb, {chat_id=chat,msg_id=msg.id,gp_name=msg.to.title})
		else
			return false
        end
		end
	end
-- return msg
 end
return {
patterns ={
"^[!/#]([Ii]d)$",
"^([Ii]d)$",
"^(ط¢غŒط¯غŒ)$",
"^(ط§غŒط¯غŒ)$",
"^[!/#]([Ii]d) (.*)$",
"^([Ii]d) (.*)$",
"^(ط¢غŒط¯غŒ) (.*)$",
"^(ط§غŒط¯غŒ) (.*)$",
"^[!/#]([Pp]in)$",
"^([Pp]in)$",
"^(ط³ظ†ط¬ط§ظ‚)$",
"^[!/#]([Uu]npin)$",
"^([Uu]npin)$",
"^(ط¨ط±ط¯ط§ط´طھظ† ط³ظ†ط¬ط§ظ‚)$",
"^[!/#]([Gg]pinfo)$",
"^([Gg]pinfo)$",
"^(ط§ط·ظ„ط§ط¹ط§طھ ع¯ط±ظˆظ‡)$",
"^[!/#]([Aa]dd)$",
"^([Aa]dd)$",
"^(ظ†طµط¨)$",
"^[!/#]([Rr]em)$",
"^([Rr]em)$",
"^(ظ„ط؛ظˆ ظ†طµط¨)$",
"^[!/#]([Ss]etowner)$",
"^([Ss]etowner)$",
"^(طھظ†ط¸غŒظ… ظ…ط§ظ„ع©)$",
"^[!/#]([Ss]etowner) (.*)$",
"^([Ss]etowner) (.*)$",
"^(طھظ†ط¸غŒظ… ظ…ط§ظ„ع©)$",
"^[!/#]([Rr]emowner)$",
"^([Rr]emowner)$",
"^(ط­ط°ظپ ظ…ط§ظ„ع©)$",
"^[!/#]([Rr]emowner) (.*)$",
"^([Rr]emowner) (.*)$",
"^(ط­ط°ظپ ظ…ط§ظ„ع©) (.*)$",
"^[!/#]([Pp]romote)$",
"^([Pp]romote)$",
"^(طھط±ظپغŒط¹)$",
"^[!/#]([Pp]romote) (.*)$",
"^([Pp]romote) (.*)$",
"^(طھط±ظپغŒط¹) (.*)$",
"^[!/#]([Dd]emote)$",
"^([Dd]emote)$",
"^(ط¹ط²ظ„)$",
"^[!/#]([Dd]emote) (.*)$",
"^([Dd]emote) (.*)$",
"^(ط¹ط²ظ„) (.*)$",
"^[!/#]([Mm]odlist)$",
"^([Mm]odlist)$",
"^(ظ„غŒط³طھ ظ†ط§ط¸ظ…)$",
"^[!/#]([Oo]wnerlist)$",
"^([Oo]wnerlist)$",
"^(ظ„غŒط³طھ ظ…ط§ظ„ع©ط§ظ†)$",
"^[!/#]([Ll]ock) (.*)$",
"^([Ll]ock) (.*)$",
"^(ظ‚ظپظ„) (.*)$",
"^[!/#]([Uu]nlock) (.*)$",
"^([Uu]nlock) (.*)$",
"^(ط¨ط§ط²ع©ط±ط¯ظ†) (.*)$",
"^[!/#]([Ss]ettings)$",
"^([Ss]ettings)$",
"^(طھظ†ط¸غŒظ…ط§طھ)$",
"^[!/#]([Mm]ute) (.*)$",
"^([Mm]ute) (.*)$",
"^(ظ‚ظپظ„) (.*)$",
"^[!/#]([Uu]nmute) (.*)$",
"^([Uu]nmute) (.*)$",
"^(ط¨ط§ط²ع©ط±ط¯ظ†) (.*)$",
"^[!/#]([Ll]ink)$",
"^([Ll]ink)$",
"^(ظ„غŒظ†ع©)$",
"^[!/#]([Ll]inkpv)$",
"^([Ll]inkpv)$",
"^(ظ„غŒظ†ع© ظ¾غŒظˆغŒ)$",
"^[!/#]([Ss]etlink)$",
"^([Ss]etlink)$",
"^(طھظ†ط¸غŒظ… ظ„غŒظ†ع©)$",
"^[!/#]([Nn]ewlink)$",
"^([Nn]ewlink)$",
"^(ظ„غŒظ†ع© ط¬ط¯غŒط¯)$",
"^[!/#]([Rr]ules)$",
"^([Rr]ules)$",
"^(ظ‚ظˆط§ظ†غŒظ†)$",
"^[!/#]([Ss]etrules) (.*)$",
"^([Ss]etrules) (.*)$",
"^(طھظ†ط¸غŒظ… ظ‚ظˆط§ظ†غŒظ†) (.*)$",
"^[!/#]([Aa]bout)$",
"^([Aa]bout)$",
"^(ط¯ط±ط¨ط§ط±ظ‡ ع¯ط±ظˆظ‡)$",
"^[!/#]([Ss]etabout) (.*)$",
"^([Ss]etabout) (.*)$",
"^(طھظ†ط¸غŒظ… ط¯ط±ط¨ط§ط±ظ‡ ع¯ط±ظˆظ‡) (.*)$",
"^[!/#]([Ss]etname) (.*)$",
"^([Ss]etname) (.*)$",
"^(طھظ†ط¸غŒظ… ظ†ط§ظ…) (.*)$",
"^[!/#]([Cc]lean) (.*)$",
"^([Cc]lean) (.*)$",
"^(ظ¾ط§ع© ع©ط±ط¯ظ†) (.*)$",
"^[!/#]([Ss]etflood) (%d+)$",
"^([Ss]etflood) (%d+)$",
"^(ط­ط³ط§ط³غŒطھ ط§ط³ظ¾ظ…) (%d+)$",
"^[!/#]([Rr]es) (.*)$",
"^([Rr]es) (.*)$",
"^(ط±ط³) (.*)$",
"^[!/#]([Ww]hois) (%d+)$",
"^([Ww]hois) (%d+)$",
"^(ط´ط®طµ) (%d+)$",
"^[!/#]([Hh]elp)$",
"^([Hh]elp)$",
"^(ط±ط§ظ‡ظ†ظ…ط§)$",
"^[!/#]([Ss]udohelp)$",
"^([Ss]udohelp)$",
"^(ط±ط§ظ‡ظ†ظ…ط§غŒ ط³ط¯ظˆ)$",
"^[!/#]([Ll]ockhelp)$",
"^([Ll]ockhelp)$",
"^(ط±ط§ظ‡ظ†ظ…ط§غŒ ظ‚ظپظ„غŒ)$",
"^[!/#]([Mm]odhelp)$",
"^([Mm]odhelp)$",
"^(ط±ط§ظ‡ظ†ظ…ط§غŒ ظ…ط¯غŒط±غŒطھغŒ)$",
"^[!/#]([Ff]unhelp)$",
"^([Ff]unhelp)$",
"^(ط±ط§ظ‡ظ†ظ…ط§غŒ ظپط§ظ†)$",
"^[!/#]([Ss]etlang) (.*)$",
"^([Ss]etlang) (.*)$",
"^(طھظ†ط¸غŒظ… ط²ط¨ط§ظ†) (.*)$",
"^[#!/]([Ff]ilter) (.*)$",
"^([Ff]ilter) (.*)$",
"^(ظپغŒظ„طھط±) (.*)$",
"^[#!/]([Uu]nfilter) (.*)$",
"^([Uu]nfilter) (.*)$",
"^(ط­ط°ظپ ظپغŒظ„طھط±) (.*)$",
"^[#!/]([Ff]ilterlist)$",
"^([Ff]ilterlist)$",
"^(ظ„غŒط³طھ ظپغŒظ„طھط±)$",
"^([https?://w]*.?t.me/joinchat/%S+)$",
"^([https?://w]*.?telegram.me/joinchat/%S+)$",
"^[!/#]([Ss]etwelcome) (.*)",
"^([Ss]etwelcome) (.*)",
"^(طھظ†ط¸غŒظ… ظˆظ„ع©ط§ظ…) (.*)",
"^[!/#]([Ww]elcome) (.*)$",
"^([Ww]elcome) (.*)$",
"^(ظˆظ„ع©ط§ظ…) (.*)$"

},
run=run,
pre_process = pre_process
}
--End GroupManager.lua--
