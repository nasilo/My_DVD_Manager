import React from 'react';

const UpcForm = props => {
  let hide = null;
  if (props.upcCode.length === 12) {
    hide = "";
  } else {
    hide = "hidden";
  }

  return(
    <div>
      <form className="new_upc" onSubmit={props.handleUpcSubmit}>
        <div className="small-12 column">
          <label htmlFor="upc_upc">UPC</label>
          <input type="text" id="upc_upc" value={props.upcCode} onChange={props.handleChangeUpc} />
          <input  type="submit" value="Search UPC" className={hide} />
        </div>
      </form>
    </div>
  )
};

export default UpcForm;
