import React from 'react';

const DvdForm = props => {
  return(
    <div>
      <form className="new_dvd" onSubmit={props.handleDvdSubmit}>
        <div className="small-10 medium-6 column">
          <label htmlFor="dvd_purchase_price">
            Purchase price
          </label>
          <input
            type="text"
            name="dvdPurchasePrice"
            id="dvd_purchase_price"
            onChange={props.handleInputChange}
            value={props.dvdPurchasePrice}
          />
        </div>

        <div className="small-10 medium-6 column">
          <label htmlFor="dvd_purchase_location">
            Purchase location
          </label>
          <input
            type="text"
            name="dvdPurchaseLocation"
            id="dvd_purchase_location"
            onChange={props.handleInputChange}
            value={props.dvdPurchaseLocation}
          />
        </div>

        <div className="small-12 column">
          <label htmlFor="dvd_title">
            Title
          </label>
          <input
            type="text"
            name="dvdTitle"
            id="dvd_title"
            onChange={props.handleInputChange}
            value={props.dvdTitle}
          />
        </div>

        <div className="small-12 column">
          <label htmlFor="dvd_synopsis">
            Synopsis
          </label>
          <textarea
            name="dvdSynopsis"
            id="dvd_synopsis"
            cols="60"
            rows="10"
            onChange={props.handleInputChange}
            value={props.dvdSynopsis}
          />
        </div>

        <div className="small-12 medium-6 column">
          <label htmlFor="dvd_user_rating">
            User rating
          </label>
          <input
            type="text"
            name="dvdUserRating"
            id="dvd_user_rating"
            onChange={props.handleInputChange}
            value={props.dvdUserRating}
          />
        </div>

        <div className="small-12 medium-6 column">
          <label htmlFor="dvd_mpaa_rating">
            MPAA Rating
          </label>
          <input
            type="text"
            name="dvdMpaaRating"
            id="dvd_mpaa_rating"
            onChange={props.handleInputChange}
            value={props.dvdMpaaRating}
          />
        </div>

        <div className="small-12 medium-6 column">
          <label htmlFor="dvd_cast">
            Cast
          </label>
          <input
            type="text"
            name="dvdCast"
            id="dvd_cast"
            onChange={props.handleInputChange}
            value={props.dvdCast}
          />
        </div>


        <div className="small-12 medium-6 column">
          <label htmlFor="dvd_director">
            Director
          </label>
          <input
            type="text"
            name="dvdDirector"
            id="dvd_director"
            onChange={props.handleInputChange}
            value={props.dvdDirector}
          />
        </div>

        <div className="small-12 medium-6 column">
          <label htmlFor="dvd_writer">
            Writer
          </label>
          <input
            type="text"
            name="dvdWriter"
            id="dvd_writer"
            onChange={props.handleInputChange}
            value={props.dvdWriter}
          />
        </div>

        <div className="small-12 medium-6 column">
          <label htmlFor="dvd_producer">
            Producer
          </label>
          <input
            type="text"
            name="dvdProducer"
            id="dvd_producer"
            onChange={props.handleInputChange}
            value={props.dvdProducer}
          />
        </div>

        <div className="small-12 medium-6 column">
          <label htmlFor="dvd_release_date">
            Release date
          </label>
          <input
            type="text"
            name="dvdReleaseDate"
            id="dvd_release_date"
            onChange={props.handleInputChange}
            value={props.dvdReleaseDate}
          />
        </div>

        <div className="small-12 medium-6 column">
          <label htmlFor="dvd_run_time">
            Run time
          </label>
          <input
            type="text"
            name="dvdRunTime"
            id="dvd_run_time"
            onChange={props.handleInputChange}
            value={props.dvdRunTime}
          />
        </div>

        <div className="small-12 medium-6 column">
          <label htmlFor="dvd_studio">
            Studio
          </label>
          <input
            type="text"
            name="dvdStudio"
            id="dvd_studio"
            onChange={props.handleInputChange}
            value={props.dvdStudio}
          />
        </div>

        <div className="small-12 column" id="dvd_submit">
          <br />
          <input
            type="submit"
            name="commit"
            value="Add DVD"
          />
        </div>
      </form>
    </div>
  )
};

export default DvdForm;
