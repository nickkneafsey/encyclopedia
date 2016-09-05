import React, { PropTypes } from 'react';

const PlayerEntry = ({player}) => (
  <li className="list-group-item" >
    {`${player.first_name} ${player.last_name}`}
    <div className="btn-group pull-right" role="group" aria-label="...">
      <a href={player.info_url} type="button" className="btn btn-default  btn-xs">Info</a>
      <a href={player.summary_url} type="button" className="btn btn-default btn-xs">Bios</a>
      <a type="button" className="btn btn-default btn-xs">Images</a>
    </div>
  </li>
)

export default PlayerEntry;
