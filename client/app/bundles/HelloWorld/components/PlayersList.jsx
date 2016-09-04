import React, { PropTypes } from 'react';

export default class PlayersList extends React.Component {
  // static propTypes = {
  //   players: PropTypes.array.isRequired,
  // };


  render() {
    const { players } = this.props;
    console.log("props", props)
    return (
      <section>
        { this.props.players.map((player) =>
          <PlayerEntry key={player.id} player={player} />
        )}
      </section>
    );
  }
}
