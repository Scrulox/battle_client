$ ->
  $.ajax
    url: "http://localhost:3000/battles/1.json"
    dataType: "json"
    method: "get"
    error: ->
      alert("This battle cannot be loaded!")
    success: (data) ->
      window.battle = data
      $(battle.players).each -> 
        player = @
        player.currentAP = 100
        player.commandMon = (monIndex, abilityIndex, effectTargets) ->
          p = this
          mon = p.monsters[monIndex]
          abilityCost = mon.abilities[abilityIndex].apCost
          if o.currentAP > abilityCost
            o.currentAP -= abilityCost
            mon.useAbility abilityIndex, effectTargets
          else
            return "You don't have enough AP to use this ability."
          return

(->
  app = angular.module("battle", [])

  monBattle = battle

  app.controller "UserMonsterController", ->
    @monsters = monBattle.players[0].monsters
  
)()


