import React, { PropTypes } from 'react';
// import PlayersWidget from '../components/PlayersWidget';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';
import Immutable from 'immutable';
import * as playersActionCreators from '../actions/playersActionCreators';

import PlayerEntry from '../components/PlayerEntry'

function select(state) {
  // Which part of the Redux global state does our component want to receive as props?
  // Note the use of `$$` to prefix the property name because the value is of type Immutable.js
  return { $$playersStore: state.$$playersStore };
}

// Simple example of a React "smart" component
const Players = (props) => {
  const { dispatch, $$playersStore } = props;
  const actions = bindActionCreators(playersActionCreators, dispatch);
  const { updatePlayers } = actions;
  const players = $$playersStore.get('players');
  const playersArray = JSON.parse(players)

  return (
    <div>
      {playersArray.map((player) =>
        <PlayerEntry player={player} id={player.id} />
      )}
    </div>
  );
};

Players.propTypes = {
  dispatch: PropTypes.func.isRequired,

  // This corresponds to the value used in function select above.
  // We prefix all property and variable names pointing to Immutable.js objects with '$$'.
  // This allows us to immediately know we don't call $$playersStore['someProperty'], but
  // instead use the Immutable.js `get` API for Immutable.Map
  $$playersStore: PropTypes.instanceOf(Immutable.Map).isRequired,
};

// Don't forget to actually use connect!
// Note that we don't export Players, but the redux "connected" version of it.
// See https://github.com/reactjs/react-redux/blob/master/docs/api.md#examples
export default connect(select)(Players);
