local Translations = {
    error = {
        ["blips_deactivated"] = "Blips deaktiviert",
        ["names_deactivated"] = "Namen deaktiviert",
        ["changed_perm_failed"] = "Wähle eine Gruppe aus!",
        ["missing_reason"] = "Du musst einen Grund angeben!",
        ["invalid_reason_length_ban"] = "Du musst einen Grund und die länge des Bans festlegen!",
        ["no_store_vehicle_garage"] = "Du kann dieses Auto nicht in der Garge parken.",
        ["no_vehicle"] = "Du bist nicht in einem Fahrzeug..",
        ["no_weapon"] = "Du hast keine Waffe in deiner Hand..",
        ["no_free_seats"] = "Dieses Fahrzeug hat keinen freien Sitz!",
        ["failed_vehicle_owner"] = "Das Fahrzeug ist schon deins..",
        ["not_online"] = "Dieser Spieler ist nicht online",
        ["no_receive_report"] = "Du bekommst keine Reports",
        ["failed_set_speed"] = "Du hast kein speed festgelegt.. (`fast` for super-run, `normal` for normal)",
        ["failed_set_model"] = "Du hast kein model festgelegt..",
        ["failed_entity_copy"] = "Keine Freeaim-Entity-Info zum Kopieren in die Zwischenablage!",
    },
    success = {
        ["blips_activated"] = "Blips aktiviert",
        ["names_activated"] = "Namen aktiviert",
        ["coords_copied"] = "Koordinaten in Zwischenablage kopiert!",
        ["heading_copied"] = "Heading in Zwischenablage kopiert!",
        ["changed_perm"] = "Gruppenrechte geändert",
        ["entered_vehicle"] = "Ins Fahrzeug gestiegen",
        ["success_vehicle_owner"] = "Das Fahrzeug ist nicht deins!",
        ["receive_reports"] = "Du erhälst Reports",
        ["entity_copy"] = "Freeaim-Entitätsinfo in die Zwischenablage kopiert!",
    },
    info = {
        ["ped_coords"] = "Ped Koordinaten:",
        ["vehicle_dev_data"] = "Fahrzeug Developer Data:",
        ["ent_id"] = "Entity ID:",
        ["net_id"] = "Net ID:",
        ["net_id_not_registered"] = "Nicht registriert",
        ["model"] = "Model",
        ["hash"] = "Hash",
        ["eng_health"] = "Motor Health:",
        ["body_health"] = "Body Health:",
        ["goto"] = "Gehe zu",
        ["remove"] = "Entfernen",
        ["confirm"] = "Bestätigen",
        ["reason_title"] = "Grund",
        ["length"] = "Länge",
        ["options"] = "Optionen",
        ["position"] = "Position",
        ["your_position"] = "zu deiner position",
        ["open"] = "Öffne",
        ["inventories"] = "Inventar",
        ["reason"] = "Du musst einen Grund angeben",
        ["give"] = "gib",
        ["id"] = "ID:",
        ["player_name"] = "Spieler Name",
        ["obj"] = "Obj",
        ["ammoforthe"] = "+%{value} Munition für die %{weapon}",
        ["kicked_server"] = "Du wurdest vom Server gekickt",
        ["check_discord"] = "🔸 Prüfe unseren Discord für mehr informationen: ",
        ["banned"] = "Du wurdest gebannt:",
        ["ban_perm"] = "\n\nDein Ban ist permanent.\n🔸 Prüfe unseren Discord für mehr Informationen: ",
        ["ban_expires"] = "\n\nBan läuftab: ",
        ["rank_level"] = "Dein Rechte Level ist jetzt ",
        ["admin_report"] = "Admin Report - ",
        ["staffchat"] = "STAFFCHAT - ",
        ["warning_chat_message"] = "^8WARNING ^7 Du wurdest verwarnt durch",
        ["warning_staff_message"] = "^8WARNING ^7 Du hast jemanden verwarnt ",
        ["no_reason_specified"] = "Keinen Grund spezifizert",
        ["server_restart"] = "Server restart, prüfe unseren Discord für mehr Informationen: ",
        ['entity_view_distance'] = "Entity-Ansichtsentfernung eingestellt auf: %{distance} Meter",
        ["entity_view_info"] = "Entitätsinformationen",
        ["entity_view_title"] = "Entity Freeaim-Modus",
        ["entity_freeaim_delete"] = "Entität löschen",
        ["entity_freeaim_freeze"] = "Entität einfrieren",
        ["entity_frozen"] = "Eingefroren",
        ["entity_unfrozen"] = "Aufgelöst",
        ["model_hash"] = "Modell-Hash:",
        ["obj_name"] = "Objektname:",
        ["ent_owner"] = "Eigentümer der Entität:",
        ["cur_health"] = "Aktuelle Gesundheit:",
        ["max_health"] = "Max. Gesundheit:",
        ["Rüstung"] = "Rüstung:",
        ["rel_group"] = "Beziehungsgruppe:",
        ["rel_to_player"] = "Beziehung zu Spieler:",
        ["rel_group_custom"] = "Benutzerdefinierte Beziehung",
        ["veh_acceleration"] = "Beschleunigung:",
        ["veh_cur_gear"] = "Aktueller Gang:",
        ["veh_speed_kph"] = "km/h:",
        ["veh_speed_mph"] = "km/h:",
        ["veh_rpm"] = "Drehzahl:",
        ["dist_to_obj"] = "Abstand:",
        ["obj_heading"] = "Überschrift:",
        ["obj_coords"] = "Koordinaten:",
        ["obj_rot"] = "Rotation:",
        ["obj_velocity"] = "Geschwindigkeit:",
        ["obj_unknown"] = "Unbekannt",
        ["you_have"] = "Du hast ",
        ["freeaim_entity"] = " die Freeaim-Entität",
        ["entity_del"] = "Entität gelöscht",
        ["entity_del_error"] = "Fehler beim Löschen der Entität",
    },
    menu = {
        ["admin_menu"] = "Admin Menu",
        ["admin_options"] = "Admin Optionen",
        ["online_players"] = "Online Spieler",
        ["manage_server"] = "Manage Server",
        ["weather_conditions"] = "Vorhandene Wetter Optionen",
        ["dealer_list"] = "Dealer Liste",
        ["ban"] = "Ban",
        ["kick"] = "kick",
        ["permissions"] = "Rechte",
        ["developer_options"] = "Developer Optionen",
        ["vehicle_options"] = "Fahrzeug Optionen",
        ["vehicle_categories"] = "Fahrzeug Kategorien",
        ["vehicle_models"] = "Fahrzeug Modelle",
        ["player_management"] = "Spieler Management",
        ["server_management"] = "Server Management",
        ["vehicles"] = "Fahrzeuge",
        ["noclip"] = "NoClip",
        ["revive"] = "Revive",
        ["invisible"] = "Unsichtbar",
        ["god"] = "Godmode",
        ["names"] = "Namen",
        ["blips"] = "Blips",
        ["weather_options"] = "Wetter Optionen",
        ["server_time"] = "Server Zeit",
        ["time"] = "Zeit",
        ["copy_vector3"] = "Kopiere vector3",
        ["copy_vector4"] = "Kopiere vector4",
        ["display_coords"] = "Zeige Koordinaten",
        ["copy_heading"] = "Kopiere Heading",
        ["vehicle_dev_mode"] = "Fahrzeug Dev Mode",
        ["spawn_vehicle"] = "Spawne Fahrzeug",
        ["fix_vehicle"] = "Fahrzeug reparieren",
        ["buy"] = "Kaufe",
        ["remove_vehicle"] = "Entferne Fahrzeug",
        ["edit_dealer"] = "Editiere Dealer ",
        ["dealer_name"] = "Dealer Name",
        ["category_name"] = "Kategorie Name",
        ["kill"] = "Kill",
        ["freeze"] = "Einfrieren",
        ["spectate"] = "Beobachten",
        ["bring"] = "Herbringen",
        ["sit_in_vehicle"] = "Ins Fahrzeug setzen",
        ["open_inv"] = "Öffne Inventar",
        ["give_clothing_menu"] = "Gib Kleidungs Menu",
        ["entity_view_options"] = "Entitätsansichtsmodus",
        ["entity_view_distance"] = "Sichtweite festlegen",
        ["entity_view_freeaim"] = "Freeaim-Modus",
        ["entity_view_peds"] = "Fußgänger anzeigen",
        ["entity_view_vehicles"] = "Fahrzeuge anzeigen",
        ["entity_view_objects"] = "Objekte anzeigen",
        ["entity_view_freeaim_copy"] = "Freeaim-Entitätsinformationen kopieren",
    },
    desc = {
        ["admin_options_desc"] = "Verschiedene. Admin Optionen",
        ["player_management_desc"] = "Siehe Spieler Optionen",
        ["server_management_desc"] = "Verschiedene Server Optionen",
        ["vehicles_desc"] = "Fahrzeug Optionen",
        ["dealer_desc"] = "Liste Existierender Dealer",
        ["noclip_desc"] = "An/Aus NoClip",
        ["revive_desc"] = "Wiederbelebe dich selbst",
        ["invisible_desc"] = "An/Aus Unsichtbarkeit",
        ["god_desc"] = "An/Aus God Mode",
        ["names_desc"] = "An/Aus Namen über den Kopf",
        ["blips_desc"] = "An/Aus Blips für Spieler auf Karte",
        ["weather_desc"] = "Ändere das Wetter",
        ["developer_desc"] = "Verschiedene Dev Optionen",
        ["vector3_desc"] = "Kopiere vector3 in Zwischenablage",
        ["vector4_desc"] = "Kopiere vector4 in Zwischenablage",
        ["display_coords_desc"] = "Zeige Koordinaten auf Blidschirm",
        ["copy_heading_desc"] = "Kopiere Heading in Zwischenablage",
        ["vehicle_dev_mode_desc"] = "Zeige Fahrzeug Information",
        ["delete_laser_desc"] = "An/Aus Laser",
        ["spawn_vehicle_desc"] = "Spawne ein Fahrzeug",
        ["fix_vehicle_desc"] = "Fixe das Fahrzeug worin du dich befindest",
        ["buy_desc"] = "Kaufe das Fahrzeug kostenlos",
        ["remove_vehicle_desc"] = "Entferne naheste Fahrzeug",
        ["dealergoto_desc"] = "Gehe zum Dealer",
        ["dealerremove_desc"] = "Entferne Dealer",
        ["kick_reason"] = "Kick Grund",
        ["confirm_kick"] = "Bestätige den Kick",
        ["ban_reason"] = "Ban Grund",
        ["confirm_ban"] = "Bestätige den Ban",
        ["sit_in_veh_desc"] = "Setze in",
        ["sit_in_veh_desc2"] = "'s Fahrzeug",
        ["clothing_menu_desc"] = "Gib das Kleidungs Menu zu",
        ["entity_view_desc"] = "Informationen über Entitäten anzeigen",
        ["entity_view_freeaim_desc"] = "Aktiviere/Deaktiviere Entitätsinformationen über Freeaim",
        ["entity_view_peds_desc"] = "Pädagogik in der Welt aktivieren/deaktivieren",
        ["entity_view_vehicles_desc"] = "Fahrzeuginformationen in der Welt aktivieren/deaktivieren",
        ["entity_view_objects_desc"] = "Objektinformationen in der Welt aktivieren/deaktivieren",
        ["entity_view_freeaim_copy_desc"] = "Kopiert die Free Aim Entitätsinfo in die Zwischenablage",
    },
    time = {
        ["ban_length"] = "Ban Länge",
        ["1hour"] = "1 Stunde",
        ["6hour"] = "6 Stunden",
        ["12hour"] = "12 Stunden",
        ["1day"] = "1 Tag",
        ["3day"] = "3 Tage",
        ["1week"] = "1 Woche",
        ["1month"] = "1 Monat",
        ["3month"] = "3 Monate",
        ["6month"] = "6 Monate",
        ["1year"] = "1 Jahr",
        ["permenent"] = "Permanent",
        ["self"] = "Selbst",
        ["changed"] = "Zeit geändert zu %{time} std 00 min",
    },
    weather = {
        ["extra_sunny"] = "Extra sonnig",
        ["extra_sunny_desc"] = "Ich schmelze!",
        ["clear"] = "Klar",
        ["clear_desc"] = "Ein perfekter Tag!",
        ["neutral"] = "Neutral",
        ["neutral_desc"] = "Nur ein regulärer Tag!",
        ["smog"] = "Smog",
        ["smog_desc"] = "Rauch Maschine!",
        ["foggy"] = "Foggy",
        ["foggy_desc"] = "Rauch Maschine x2!",
        ["overcast"] = "überzogen",
        ["overcast_desc"] = "Nicht zu sonnig!",
        ["clouds"] = "Wolken",
        ["clouds_desc"] = "Wo ist die Sonne?",
        ["clearing"] = "Klarer",
        ["clearing_desc"] = "Wolken beginnen sich zu verziehen!",
        ["rain"] = "Rain",
        ["rain_desc"] = "Lass es regnen!",
        ["thunder"] = "Gewitter",
        ["thunder_desc"] = "Lauf und Verstecke dich!",
        ["snow"] = "Snow",
        ["snow_desc"] = "Ist es kalt hier?",
        ["blizzard"] = "Blizzard",
        ["blizzed_desc"] = "Schneemaschine?",
        ["light_snow"] = "Leichter Schnee",
        ["light_snow_desc"] = "Ein Gefühl von Weihnachten kommt auf !",
        ["heavy_snow"] = "Starker Schneefall (XMAS)",
        ["heavy_snow_desc"] = "Schneeballschlacht!",
        ["halloween"] = "Halloween",
        ["halloween_desc"] = "Was war das für ein Lärm?!",
        ["weather_changed"] = "Wetter gewechselt zu: %{value}",
    },
    commands = {
        ["blips_for_player"] = "Zeige Blips für Spieler (Admin)",
        ["player_name_overhead"] = "Zeige Spielername überkopf (Admin)",
        ["coords_dev_command"] = "aktiviere Koordinaten auf der Anzeige für Devstuff (Admin)",
        ["toogle_noclip"] = "wechsel in den noclip (Admin)",
        ["save_vehicle_garage"] = "Speicher Fahrzeug in deiner Garage (Admin)",
        ["make_announcement"] = "Mach eine Ansage (Admin)",
        ["open_admin"] = "Öffne Admin Menu (Admin)",
        ["staffchat_message"] = "Sende Nachricht an alle Staffmitglieder (Admin)",
        ["nui_focus"] = "Gib einem Spieler NUI Focus (Admin)",
        ["warn_a_player"] = "Verwarne einen Spieler (Admin)",
        ["check_player_warning"] = "Prüfe Spielerwarnungen (Admin)",
        ["delete_player_warning"] = "Lösche Spielerwahrungen (Admin)",
        ["reply_to_report"] = "Antworte auf einen Report (Admin)",
        ["change_ped_model"] = "Ändere Ped Model (Admin)",
        ["set_player_foot_speed"] = "Setze Spieler geschwindigkeit zu Fuß (Admin)",
        ["report_toggle"] = "durchforste eingehende Reports (Admin)",
        ["kick_all"] = "Kicke alle Spieler",
        ["ammo_amount_set"] = "Setze deine Munitionsstückzahl (Admin)",
    }
}

if GetConvar('qb_locale', 'en') == 'de' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
