ix.lang.AddTable("russian", {
	r_mark_greetings_1f = "Co mogę dla Pani zrobić, obywatelko?",
	r_mark_greetings_2f = "Czy czegoś Pani potrzebuje?",
	r_mark_greetings_3f = "Słucham.",
	r_mark_greetings_1m = "W czym mogę pomóc, obywatelu?",
	r_mark_greetings_2m = "Słucham Pana.",
	r_mark_greetings_3m = "Tak, tak?",
	r_mark_neverseen = "Tak, to prawda.\nDepartament Mieszkalnictwa i Własności wraz z administracją miasta przygotowuje reformy, dlatego wszędzie trwają zmiany kadrowe. Ciężkie czasy, szczególnie w takim kryzysie dla strefy przemysłowej miasta. Teraz odpowiadam tutaj za wydawanie poczty, a wkrótce również za dokumenty dotyczące wynajmu mieszkań, nowych punktów biznesowych i innej własności...\nMówią, że planują ponownie uruchomić gospodarkę miasta. Tak to wygląda.",
	r_mark_rent = "Nie mogę teraz o tym mówić. Departament nie jest jeszcze gotowy, może innym razem.",
	r_mark_rumours = "Nie, na razie jest spokojnie.",
	r_mark_checkmail = "Dobrze. Proszę podać kartę.",
	t_mail_check_id = "Podaj kartę #%s.",
	t_mark_neverseen_f = "Nigdy wcześniej Pani tutaj nie widziałam.",
	t_mark_neverseen_m = "Nigdy wcześniej cię tutaj nie widziałem.",
	t_mark_rent_f = "Chciałabym porozmawiać o wynajmie/zakupie lokalu.",
	t_mark_rent_m = "Chciałbym porozmawiać o wynajmie/zakupie lokalu.",
	t_mark_checkmail_f = "Chciałabym sprawdzić pocztę.",
	t_mark_checkmail_m = "Chciałbym sprawdzić pocztę.",
	t_mark_rumours = "Słyszałeś ostatnio coś ciekawego?",
	t_generic_goodbye = "Do zobaczenia.",
	t_checkmail_no_m = "Zmieniam zdanie.",
	t_checkmail_no_f = "Zmieniam zdanie.",
	r_rumour1 = "Krążą plotki, że w strefie przemysłowej przeprowadzono jakiś nieudany eksperyment i teraz wszyscy zostaliśmy tu bez działających urządzeń! Jak długo to potrwa, nikt nie wie.\nChwała Unii, że wypłacają nam zasiłki, bo inaczej można by umrzeć z głodu...",
})

ix.lang.AddTable("english", {
	r_mark_greetings_1f = "What can I do for you?",
	r_mark_greetings_2f = "Do you need something?",
	r_mark_greetings_3f = "I'm listening.",
	r_mark_greetings_1m = "How can I help you?",
	r_mark_greetings_2m = "I am listening to you.",
	r_mark_greetings_3m = "Yes?",
	r_mark_neverseen = "Yes, that's true.\nThe Department of Housing and Property, together with the city administration, is preparing reforms in the city, and therefore there are continuous personnel shifts everywhere. A difficult time, especially in such a crisis for the city’s industrial zone. I’m here now for I am responding to the issuance of mail, and soon - drawing up documents for the rental of residential apartments, places of business and other property...\nIt is said that they want to restart the city’s economy. In general, somehow.",
	r_mark_rent = "Now I can’t talk about it. The department is not ready for this yet, maybe another time.",
	r_mark_rumours = "No. Everything is quiet.",
	r_mark_checkmail = "Okay. Citizen card please.",
	t_mail_check_id = "Gave him citizen card #%s.",
	t_mark_neverseen_f = "I've never seen you here before.",
	t_mark_neverseen_m = "I've never seen you here before.",
	t_mark_rent_f = "I would like to talk about renting / buying a room.",
	t_mark_rent_m = "I would like to talk about renting / buying a room.",
	t_mark_checkmail_f = "I would like to check my mail.",
	t_mark_checkmail_m = "I would like to check my mail.",
	t_mark_rumours = "Have you heard anything lately?",
	t_generic_goodbye = "See you.",
	t_checkmail_no_m = "I changed my mind.",
	t_checkmail_no_f = "I changed my mind.",
	r_rumour1 = "It is rumored that some unsuccessful experiment took place in the industrial zone, and now we are all left without working phases! How long will it last, damn him.\nPraise to the Union that we are paid benefits, otherwise it’s possible die of hunger...",
})

ix.dialogues.Add("cp", {
	["GREETINGS"] = {
		response = {
			[1] = {
				condition = function(client) 
					if client:IsCombine() or client:IsCityAdmin() then
						return "Służę Kombinatowi!"
					else
						return {
									"Przechodź.",
									"...",
									"Idź stąd.",
									"Obywatelu.",
									"Nie marnuj mojego czasu.",
									"Czego chcesz?",
								}
					end
				end,
			}
		},
		choices = {"GOODBYE"}
	},
	["GOODBYE"] = {
		topic = "...",
		flags = DFLAG_GOODBYE
	}
})


ix.dialogues.Add("_Rumours", {
	["ARumour1"] = {
		response = "@r_rumour1",
		flags = bit.bor(DFLAG_RUMOURS, DFLAG_ONCE)
	}
})


--------------------------------------------------------------------
--------------------------------------------------------------------
--------------------------------------------------------------------


ix.dialogues.Add("mark_pootis", {
	["GREETINGS"] = {
		response = "Cześć. W czym mogę pomóc?",
		choices = {
			"GarbageWorkDone",
			"WaterWorkDone",
			"ToolsWorkDone",
			"CWUWork",
			"WhereIam",
			"CWUSetup",
			"GOODBYE"
		}
	},
	["OKAY_NO_WORK"] = {
		response = "Dobrze.",
		topic = {
			[1] = {
				text = "Zmieniłam zdanie.",
				gender = GENDER_FEMALE
			},
			[2] = {
				text = "Zmieniłem zdanie, przepraszam.",
				gender = GENDER_MALE
			},
		},
		choices = {"CWUWork", "WhereIam", "CWUSetup", "GOODBYE"}
	},
	["NoWork"] = {
		response = "Dzisiaj nie mam dla Ciebie pracy. Wróć później.",
		topic = {
			[1] = {
				text = "Cześć. Chciałabym podjąć się pracy w Waszym biurze.",
				gender = GENDER_FEMALE
			},
			[2] = {
				text = "Cześć. Chciałbym podjąć się pracy w Waszym biurze.",
				gender = GENDER_MALE
			},
		},
	},
	["CWUWork"] = {
		response = {
			[1] = {
				condition = function(client, npc, self)
					local gender = client:GetCharacter():GetGender()

					if self.data.haswork then
						return gender == GENDER_MALE and "Masz już pracę. Najpierw ją wykonaj, potem wróć." or "Masz już pracę. Najpierw ją wykonaj, potem wróć."
					elseif self.data.workcooldown and os.time() < self.data.workcooldown then
						return gender == GENDER_MALE and "Przepraszam. Osiągnąłeś limit, wróć później." or "Przepraszam. Osiągnęłaś limit, wróć później."
					end

					return "No cóż, zazwyczaj o coś innego nikt mnie nie pyta. Co chcesz dziś robić?"
				end
			}
		},
		topic = {
			[1] = {
				text = "Cześć. Chciałabym podjąć się pracy w Waszym biurze.",
				gender = GENDER_FEMALE
			},
			[2] = {
				text = "Cześć. Chciałbym podjąć się pracy w Waszym biurze.",
				gender = GENDER_MALE
			},
		},
		choices = function(client, npc, dialogue)
			local choices = {}

			if (!dialogue.data.workcooldown or (dialogue.data.workcooldown and os.time() > dialogue.data.workcooldown)) and !dialogue.data.haswork then
				choices = {
					{label = "Sprzątanie śmieci w mieście.", work = 2},
					{label = "Wymiana wkładów w automatach z wodą.", work = 4},
					{label = "Poszukiwanie narzędzi.", work = 5},
					{label = "Zmieniłem zdanie, przepraszam.", topic = "OKAY_NO_WORK"}
				}
			else
				choices = {
					{label = "...", topic = "OKAY_NO_WORK"}
				}
			end

			return choices
		end,
		choose = function(choice, client, npc, dialogue)
			local character = client:GetCharacter()

			if choice.work == 2 then
				if SERVER then
					local quests = character:GetData("quests", {})
					quests["cwu_garbage"] = true
					character:SetData("cwuGarbage", 0)
					character:SetData("quests", quests)
					net.Start("ixUpdateQuests")
					net.Send(client)
				end

				dialogue.data.haswork = true

				return "GarbageWork"

			elseif choice.work == 4 then
				if SERVER then
					local quests = character:GetData("quests", {})
					quests["cwu_water"] = os.time()
					character:SetData("cwuWater", 0)
					character:SetData("quests", quests)
					net.Start("ixUpdateQuests")
					net.Send(client)
				end

				dialogue.data.haswork = true

				return "WaterWork"

			elseif choice.work == 5 then
				if SERVER then
					local quests = character:GetData("quests", {})
					quests["cwu_tools"] = true
					character:SetData("cwuTools", 0)
					character:SetData("quests", quests)
					net.Start("ixUpdateQuests")
					net.Send(client)
				end

				dialogue.data.haswork = true

				return "ToolsWork"
			end

			return choice.topic and choice.topic or "OKAY_NO_WORK"
		end,
		flags = DFLAG_DYNAMIC
	},
	["GarbageWorkDone"] = {
		response = {
			[1] = {
				text = {
					"Nieźle, lubię takich pracowników! Oto twoje dziesięć tokenów za pracę.",
					"Dobra robota. Oto twoja nagroda.",
					"Godna płaca za godną pracę.",
				},
			},
		},
		topic = {
			[1] = {
				text = "Zebrałam wszystkie śmieci, jakie tylko mogłam znaleźć.",
				gender = GENDER_FEMALE
			},
			[2] = {
				text = "Zebrałem wszystkie śmieci, jakie tylko mogłem znaleźć.",
				gender = GENDER_MALE
			},
		},
		select = function(client, npc, self)
			local character = client:GetCharacter()
			if SERVER then
				local quests = character:GetData("quests", {})
				quests["cwu_garbage"] = nil

				character:SetData("quests", quests)
				character:SetMoney(character:GetMoney() + 10)
				net.Start("ixUpdateQuests")
				net.Send(client)

				client:NotifyLocalized("Otrzymałeś 10 tokenów.")
			end

			self.data.haswork = false
			self.data.workcooldown = os.time() + 14400
		end,
		condition = function(client, npc, self)
			local character = client:GetCharacter()

			return self.data.haswork and character:GetData("quests", {})["cwu_garbage"] and character:GetData("cwuGarbage", 0) == 4
		end
	},
	["WhereIam"] = {
		response = "Znajdujesz się w biurze Związku Pracowników Obywatelskich. Tutaj ludzie zazwyczaj dostają różne prace, od prostych zajęć po bardziej prestiżowe stanowiska, np. w fabrykach. Jeśli chcesz dowiedzieć się więcej, znajdź innego pracownika, który nie jest tak zajęty jak ja. Oni ci pomogą.",
		topic = "Gdzie ja jestem?",
	},
	["CWUSetup"] = {
		response = "Musisz porozmawiać z naszym przełożonym. Zazwyczaj bywa tutaj dość często i nosi elegancki garnitur. Jeśli go nie ma, znajdź kogoś, kto nie siedzi przy moim biurku. Niestety, nie mogę zająć się tym osobiście.",
		topic = "Jak mogę dostać taką świetną koszulę jak ty i stałą pracę?",
	},
	["GOODBYE"] = {
		topic = "Do zobaczenia.",
		flags = DFLAG_GOODBYE
	}
})










--------------------------------------------------------------------
--------------------------------------------------------------------
--------------------------------------------------------------------

-- ix.dialogues.Add("mark_pootisman", {
-- 	["GREETINGS"] = {
-- 		response = {
-- 			[1] = {
-- 				text = {"@r_mark_greetings_1f", "@r_mark_greetings_2f", "@r_mark_greetings_3f"},
-- 				gender = GENDER_FEMALE
-- 			},
-- 			[2] = {
-- 				text = {"@r_mark_greetings_1m", "@r_mark_greetings_2m", "@r_mark_greetings_3m"},
-- 				gender = GENDER_MALE
-- 			},
-- 		},
-- 		choices = {"NeverSeenYou", "Rent", "CheckMail", "LatestRumours", "GOODBYE"}
-- 	},
-- 	["NeverSeenYou"] = {
-- 		response = "@r_mark_neverseen",
-- 		data = {
-- 			mailtopic = true,
-- 			renttopic = true
-- 		},
-- 		topic = {
-- 			[1] = {
-- 				text = "@t_mark_neverseen_f",
-- 				gender = GENDER_FEMALE
-- 			},
-- 			[2] = {
-- 				text = "@t_mark_neverseen_m",
-- 				gender = GENDER_MALE
-- 			},
-- 		},
-- 		flags = DFLAG_ONCE
-- 	},
-- 	["Rent"] = {
-- 		response = "@r_mark_rent",
-- 		topic = {
-- 			[1] = {
-- 				text = "@t_mark_rent_f",
-- 				gender = GENDER_FEMALE
-- 			},
-- 			[2] = {
-- 				text = "@t_mark_rent_m",
-- 				gender = GENDER_MALE
-- 			},
-- 		},
-- 		condition = function(client, npc, self) return self.data.renttopic end,
-- 	},
-- 	["CheckMail"] = {
-- 		response = "@r_mark_checkmail",
-- 		topic = {
-- 			[1] = {
-- 				text = "@t_mark_checkmail_f",
-- 				gender = GENDER_FEMALE
-- 			},
-- 			[2] = {
-- 				text = "@t_mark_checkmail_m",
-- 				gender = GENDER_MALE
-- 			},
-- 		},
-- 		choices = function(client, npc, dialogue) 
-- 			local choices = {}
-- 			for k, v in pairs(client:GetCharacter():GetInventory():GetItemsByUniqueID("cid")) do
-- 				local citizenID = v:GetData("id", "0000")

-- 				choices[#choices + 1] = {label = L("t_mail_check_id", client, citizenID), cid = citizenID}
-- 			end

-- 			choices[#choices + 1] = {label = client:GetCharacter():GetGender() == GENDER_MALE and "@t_checkmail_no_m" or "@t_checkmail_no_f"}

-- 			return choices
-- 		end,
-- 		choose = function(choice, client, npc, dialogue)
-- 			if SERVER and choice.cid then
-- 				client:OpenMailbox(choice.cid)
-- 			end
-- 			return choice.cid and "GOODBYE" or "GREETINGS"
-- 		end,
-- 		condition = function(client, npc, self) return self.data.mailtopic end,
-- 		flags = DFLAG_DYNAMIC
-- 	},
-- 	["LatestRumours"] = {
-- 		response = "@r_mark_rumours",
-- 		topic = "@t_mark_rumours",
-- 		rumours = true
-- 	},
-- 	["GOODBYE"] = {
-- 		topic = "@t_generic_goodbye",
-- 		flags = DFLAG_GOODBYE
-- 	}
-- })