// Sort.es6.jsx
class SortItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = { direction: 'none' };
  }
  handleClick(prevState) {
    if (prevState === 'none') {
      this.setState({ direction: 'desc' })
    } else if (prevState === 'desc' ) {
      this.setState({ direction: 'asc' })
    } else if (prevState === 'asc' ) {
      this.setState({ direction: 'none' })
    }
  }
  render() {
    let icon;
    if ( this.state.direction === 'none' ) {
      icon = <i className= 'fa fa-minus' onClick={ () => this.handleClick(this.state.direction) }/>;
    } else if ( this.state.direction === 'desc' ) {
      icon = <i className= 'fa fa-chevron-down' onClick={ () => this.handleClick(this.state.direction) }/>
    } else {
      icon = <i className= 'fa fa-chevron-up' onClick={ () => this.handleClick(this.state.direction) }/>;
    }
    return (
      <li dir={this.state.direction} id={this.props.sortName}>
        { this.props.sortName }
        { icon }
      </li>
    );
  }
}


class Sort extends React.Component {
  render () {
    return (
      <ul className='sort-items'>
        <SortItem sortName='difficulty'/>
        <SortItem sortName='price'/>
        <SortItem sortName='timecreated'/>
      </ul>
    );
  }
}


Sort.propTypes = {
  difficulty: React.PropTypes.string
};
