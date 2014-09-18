window.isTeamDead = (monster, index, array) ->
  monster.isAlive() is false
window.isTurnOver = (object, index, array) ->
  object.turn is false
window.setAll = (array, attr, value) ->
  n = array.length
  i = 0
  while i < n
    array[i][attr] = value
    i++
  return

# $ ->
#   $.ajax
#     url: "http://localhost:3000/battles/1.json"
#     dataType: "json"
#     method: "get"
#     error: ->
#       alert("This battle cannot be loaded!")
#     success: (data) ->
#       window.battle = data
#       battle.round = 0
#       battle.maxAP = 100
#       setAll(battle.players, "ap", battle.maxAP)
#       battle.checkRound = -> 
#         players = battle.players
#         if players.every(isTurnOver)
#           setAll(players, "turn", true)
#           setAll(players, "ap", battle.maxAp)
#           battle.round += 1
#           alert("This round is over.") 
#         else 
#           alert("This ain't over.")
#         return
#       battle.outcome = ->
#         if @players[0].monsters.every(isTeamDead) is true
#           alert "You have lost."
#         else if @players[1].monsters.every(isTeamDead) is true
#           alert "You have won."
#         else
#           alert "go fuck yourself"
#         return
#       battle.monAbility = (playerIndex, monIndex, abilityIndex, targetIndex) -> 
#         ability = @players[playerIndex].monsters[monIndex].abilities[abilityIndex]
#         player = @players[playerIndex]
#         switch ability.targeta
#           when "target"
#             targets = [ player.enemies[targetIndex] ]
#           when "teamTarget"
#             targets = [ player.monsters[targetIndex] ]
#           when "enemyTeam"
#             targets = player.enemies
#           when "selfTeam"
#             targets = player.monsters
#         @players[playerIndex].commandMon(monIndex, abilityIndex, targets)
#         @outcome()
#         @checkRound()
#       battle.players[0].enemies = battle.players[1].monsters
#       battle.players[1].enemies = battle.players[0].monsters
#       $(battle.players).each ->
#         player = @
#         player.turn = true
#         player.commandMon = (monIndex, abilityIndex, targets) ->
#           p = @
#           mon = p.monsters[monIndex]
#           abilityCost = mon.abilities[abilityIndex].ap_cost
#           if p.ap > abilityCost
#             p.ap -= abilityCost
#             mon.useAbility abilityIndex, targets
#           else
#             return "You don't have enough AP to use this ability."
#           return
#         $(player.monsters).each ->
#           monster = @
#           monster.isAlive = -> 
#             if @hp <= 0
#               return false
#             else
#               return true
#             return
#           monster.useAbility = (abilityIndex, abilityTargets) ->
#             ability = @abilities[abilityIndex]
#             effectTargets = ability.effectTargets
#             console.log(effectTargets)
#             ability.use(abilityTargets, effectTargets)
#           $(monster.abilities).each ->
#             ability = @
#             ability.effectTargets = []
#             ability.effects.forEach (effect, index) ->
#               effectTargets = []
#               switch effect.targeta
#                 when "self"
#                   effectTargets.push monster
#                   ability.effectTargets.push effectTargets
#                 when "aoeTeam"
#                   effectTargets.push player.monsters
#                   ability.effectTargets.push effectTargets
#                 when "aoeEnemy"
#                   effectTargets.push player.enemies
#                   ability.effectTargets.push effectTargets
#             ability.use = (abilitytargets, effectTargets) ->
#               a = this
#               i = 0
#               while i < abilitytargets.length
#                 monTarget = abilitytargets[i]
#                 monTarget[a.stat] = eval(monTarget[a.stat] + a.stat_change)
#                 monTarget.isAlive()
#                 i++
#               if typeof effectTargets isnt "undefined"
#                 i = 0
#                 while i < effectTargets.length
#                   effect = a.effects[i]
#                   targets = effectTargets[i]
#                   console.log(effect)
#                   console.log(targets)
#                   effect.activate targets
#                   i++
#               return
#             $(ability.effects).each ->
#               @activate = (effectTargets) ->
#                 e = this
#                 i = 0
#                 while i < effectTargets.length
#                   monTarget = effectTargets[i]
#                   monTarget[e.stat] = eval(monTarget[e.stat] + e.stat_change)
#                   monTarget.isAlive()
#                   i++
#                 return

# for testing 
# battle.monAbility(0,1,0,0)
# battle.players[0].enemies[0]
# battle.players[0].monsters[1]
# battle.players[1].monsters[0]






