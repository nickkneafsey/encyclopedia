import Immutable from 'immutable';

import actionTypes from '../constants/playersConstants';

export const $$initialState = Immutable.fromJS({
  players: [], // this is the default state that would be used if one were not passed into the store
});

export default function playersReducer($$state = $$initialState, action) {
  const { type, players } = action;

  switch (type) {
    case actionTypes.PLAYERS_LIST_UPDATE:
      return $$state.set('players', players);

    default:
      return $$state;
  }
}
