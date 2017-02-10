import React from 'react';

const UpcForm = props => {
  let hide = null;
  if (props.upcCode.length === 12) {
    hide = "button secondary";
  } else {
    hide = "hidden";
  }

  return(
    <div>
      <form className="new_upc row" onSubmit={props.handleUpcSubmit}>
        <div className="small-2 columns">
          <label htmlFor="upc_upc" className="text-right middle">UPC</label>
        </div>
        <div className="small-8 columns">
          <input type="text" id="upc_upc" value={props.upcCode} onChange={props.handleChangeUpc} />
        </div>
        <div className="small-2 columns">
          <input  type="submit" value="Search UPC" className={hide} />
        </div>
      </form>
    </div>
  )
};

export default UpcForm;
