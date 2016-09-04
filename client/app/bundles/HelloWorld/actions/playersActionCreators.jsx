import actionTypes from '../constants/playersConstants';

export function updatePlayers(players) {
  return {
    type: actionTypes.PLAYERS_LIST_UPDATE,
    players,
  };
}
